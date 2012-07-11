#!/bin/sh

# 發布包所在目錄
package_path="/Users/beiwei/Sites/deploy/package/"
# 代碼目錄
resource_path="/Users/beiwei/Sites/deploy/source/"
# 框架目錄
framework_path="/Users/beiwei/Sites/yii/framework"
# 網站根目錄
webroot_path="/Users/beiwei/Sites/deploy/webroot"
package_name=""

_chk_file_exists() {
    echo 'Plase Input Package File Name: \c'
    # 关闭自动打印输入字符的功能
    # stty -echo
    read pk_name < /dev/tty
    # 打開自動打印輸入字符的功能
    # stty echo

    # 取文件名
    # echo ${pk_name%.*}
    # 取文件後綴名
    # echo ${pk_name##*.}

    if [ -f $package_path$pk_name ]
    then
        # 確認要發布
        echo "確認要發布:"$pk_name"? Please answer yes or no"
        read YES_OR_NO
        if [ "$YES_OR_NO" == "no" ]; then
            echo 'Deploy has been canceld'
            exit 0
        else
            package_name=`date "+%Y%m%d%H%M"`
            `cp $package_path$pk_name $resource_path$package_name.${pk_name##*.}`
            `unzip -qo ${resource_path}${package_name}.${pk_name##*.} -d ${resource_path}${package_name}`
            `rm -f ${resource_path}${package_name}.${pk_name##*.}`
        fi
    else
        echo '發布失敗, 不存在的包文件'
        exit 0
    fi
}

_touch_files() {
    # 是否發布成功
    if [ -z $package_name ]; then
        echo '不存在的包名'
        exit 0
    fi

    for _tmp_dir in "protected/runtime" "apps/assets" "apps/theme"; do
        # 如果緩存目錄不存在則創建
        _tmp_file="${resource_path}${package_name}/${_tmp_dir}"
        if [ ! -d "${_tmp_dir}" ]; then
            `mkdir -p ${_tmp_file}`
        fi

        # 賦權限
        `chmod 777 ${_tmp_file}`
    done
}

_touch_symbole_link() {
    if [ ! -f "${resource_path}${package_name}/framework" ]; then
        `ln -s ${framework_path} "${resource_path}${package_name}/framework"`
    fi

    # -f 是否是文件
    # -d 是否是目錄
    # -z 是否存在值
    # -r 是否可讀
    # -w 是否可寫
    # -s 對象長度是否為0
    # -x 是否可執行
    # 判斷是否是符號鏈接
    if [ -L $webroot_path ]; then
        `unlink $webroot_path`
    fi

    `ln -s ${resource_path}${package_name} ${webroot_path}`
}

_chk_file_exists
_touch_files
_touch_symbole_link
