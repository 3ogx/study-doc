
## php反射机制

    php --rf
    php --rc
    php --ri
    php --re

先看個例子

<code><span style="color: #000000">
<span style="color: #0000BB">&lt;?php<br /></span><span style="color: #FF8000">/\*\*<br />&nbsp;\*&nbsp;一個用戶權限的服務類<br />&nbsp;\*\*/<br /></span><span style="color: #007700">class&nbsp;</span><span style="color: #0000BB">UserRoleService&nbsp;</span><span style="color: #007700">{<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #FF8000">/\*&nbsp;公共&nbsp;\*/<br />&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #007700">public&nbsp;</span><span style="color: #0000BB">$user</span><span style="color: #007700">;<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #FF8000">/\*&nbsp;公共方法&nbsp;\*/<br />&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #007700">public&nbsp;function&nbsp;</span><span style="color: #0000BB">getUserRole</span><span style="color: #007700">()&nbsp;{}<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #FF8000">/\*&nbsp;私有方法&nbsp;\*/<br />&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #007700">private&nbsp;function&nbsp;</span><span style="color: #0000BB">_getUser</span><span style="color: #007700">(</span><span style="color: #0000BB">$uid</span><span style="color: #007700">)&nbsp;{}<br /><br />}<br /><br /></span><span style="color: #FF8000">/\*&nbsp;類反射機制,因為 `_getUser` 是個私有方法,不能在外部調用,使用反射機制可以調用&nbsp;\*/<br /></span><span style="color: #0000BB">$obj&nbsp;</span><span style="color: #007700">=&nbsp;new&nbsp;</span><span style="color: #0000BB">ReflectionMethod</span><span style="color: #007700">(</span><span style="color: #DD0000">'UserRoleService'</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">'_getUser'</span><span style="color: #007700">);<br /><br /></span><span style="color: #FF8000">/\*&nbsp;一定要設置這個屬性,php5.3.2以上後的版本才會支持&nbsp;\*/<br /></span><span style="color: #0000BB">$obj</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">setAccessible</span><span style="color: #007700">(</span><span style="color: #0000BB">true</span><span style="color: #007700">);<br /><br /></span><span style="color: #FF8000">/\*&nbsp;這個用法在做自動化測試時非常有用&nbsp;\*/<br /></span><span style="color: #0000BB">$obj</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">invoke</span><span style="color: #007700">(new&nbsp;</span><span style="color: #0000BB">UserRoleService</span><span style="color: #007700">(),&nbsp;</span><span style="color: #0000BB">$uid</span><span style="color: #007700">);<br /><br /></span>
</span>
</code>
##PHPUnit套件

<span style="color: #0000BB">$this</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">markTestSkipped</span><span style="color: #007700">();<br /></span>