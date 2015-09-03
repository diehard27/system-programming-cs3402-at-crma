[กลับไปหน้าหลัก](CourseSchedule2555_2.md)-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: [ทบทวนก่อนสอบระหว่างภาค](midtermReview.md)
<table width='500'>
<td>
<br>
<br>
<h1>What are regular expressions?</h1>
A regular expression is a pattern that describes a set of strings. Regular expressions are constructed analogously to arithmetic expressions by using various operators to combine smaller expressions.<br>
<br>
The fundamental building blocks are the regular expressions that match a single character. Most characters, including all letters and digits, are regular expressions that match themselves. Any metacharacter with special meaning may be quoted by preceding it with a backslash.<br>
<br>
<h1>Operators</h1>

<table><thead><th>Operator</th><th>Effect</th></thead><tbody>
<tr><td>.       </td><td>	Matches any single character.</td></tr>
<tr><td>?       </td><td>	The preceding item is optional and will be matched, at most, once.</td></tr>
<tr><td><code>*</code></td><td>	The preceding item will be matched zero or more times.</td></tr>
<tr><td>+       </td><td>	The preceding item will be matched one or more times.</td></tr>
<tr><td>{N}     </td><td>	The preceding item is matched exactly N times.</td></tr>
<tr><td>{N,}    </td><td>	The preceding item is matched N or more times.</td></tr>
<tr><td>{N,M}   </td><td>	The preceding item is matched at least N times, but not more than M times.</td></tr>
<tr><td>-       </td><td>	represents the range if it's not first or last in a list or the ending point of a range in a list.</td></tr>
<tr><td>^       </td><td>	Matches the empty string at the beginning of a line; also represents the characters not in the range of a list.</td></tr>
<tr><td>$       </td><td>	Matches the empty string at the end of a line.</td></tr>
<tr><td>\b      </td><td>	Matches the empty string at the edge of a word.</td></tr>
<tr><td>\B      </td><td>	Matches the empty string provided it's not at the edge of a word.</td></tr>
<tr><td>\<      </td><td>	Match the empty string at the beginning of word.</td></tr>
<tr><td>\>      </td><td>	Match the empty string at the end of word.</td></tr></tbody></table>

Two regular expressions may be concatenated; the resulting regular expression matches any string formed by concatenating two substrings that respectively match the concatenated subexpressions.<br>
<br>
Two regular expressions may be joined by the infix operator "|"; the resulting regular expression matches any string matching either subexpression.<br>
<br>
Repetition takes precedence over concatenation, which in turn takes precedence over alternation. A whole subexpression may be enclosed in parentheses to override these precedence rules<br>
<br>
<h1>Basic versus extended regular expressions</h1>

In basic regular expressions the metacharacters "?", "+", "{", "|", "(", and ")" lose their special meaning; instead use the backslashed versions "\?", "\+", "\{", "\|", "\(", and "\)".<br>
<br>
<h1>Examples using grep</h1>

<h2>What is grep?</h2>

grep searches the input files for lines containing a match to a given pattern list. When it finds a match in a line, it copies the line to standard output (by default), or whatever other sort of output you have requested with options.<br>
<br>
Though grep expects to do the matching on text, it has no limits on input line length other than available memory, and it can match arbitrary characters within a line. If the final byte of an input file is not a newline, grep silently supplies one. Since newline is also a separator for the list of patterns, there is no way to match newline characters in a text.<br>
<br>
Some examples:<br>
<br>
<pre><code>prachya ~&gt; grep root /etc/passwd<br>
root:x:0:0:root:/root:/bin/bash<br>
operator:x:11:0:operator:/root:/sbin/nologin<br>
</code></pre>
With the first command, user prachya displays the lines from /etc/passwd containing the string root.<br>
<br>
Then she displays the line numbers containing this search string.<br>
<pre><code>prachya ~&gt; grep -n root /etc/passwd<br>
1:root:x:0:0:root:/root:/bin/bash<br>
12:operator:x:11:0:operator:/root:/sbin/nologin<br>
</code></pre>
Using -v option for inverting the sense of matching, to select non-matching lines.<br>
<pre><code>prachya ~&gt; grep -v bash /etc/passwd | grep -v nologin<br>
sync:x:5:0:sync:/sbin:/bin/sync<br>
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown<br>
halt:x:7:0:halt:/sbin:/sbin/halt<br>
news:x:9:13:news:/var/spool/news:<br>
mailnull:x:47:47::/var/spool/mqueue:/dev/null<br>
xfs:x:43:43:X Font Server:/etc/X11/fs:/bin/false<br>
rpc:x:32:32:Portmapper RPC user:/:/bin/false<br>
nscd:x:28:28:NSCD Daemon:/:/bin/false<br>
named:x:25:25:Named:/var/named:/bin/false<br>
squid:x:23:23::/var/spool/squid:/dev/null<br>
ldap:x:55:55:LDAP User:/var/lib/ldap:/bin/false<br>
apache:x:48:48:Apache:/var/www:/bin/false<br>
</code></pre>
With the third command she checks which users are not using bash, but accounts with the nologin shell are not displayed.<br>
Then she counts the number of accounts that have /bin/false as the shell.<br>
Option -c counts the matched lines.<br>
<pre><code>prachya ~&gt; grep -c false /etc/passwd<br>
3<br>
</code></pre>
Option -i ignores case sensitivity search.<br>
<pre><code>prachya ~&gt; grep -i ps ~/.bash* | grep -v history<br>
/home/prachya/.bashrc:PS1="\[\033[1;44m\]$USER is in \w\[\033[0m\] "<br>
</code></pre>
The last command displays the lines from all the files in her home directory starting with ~/.bash, excluding matches containing the string history, so as to exclude matches from ~/.bash_history which might contain the same string, in upper or lower cases. Note that the search is for the string "ps", and not for the command ps.<br>
<br>
<h2>Grep and regular expressions</h2>

<blockquote>If you are not on Linux</blockquote>

We use GNU grep in these examples, which supports extended regular expressions. GNU grep is the default on Linux systems. If you are working on proprietary systems, check with the -V option which version you are using. GNU grep can be downloaded from <a href='http://gnu.org/directory/'>http://gnu.org/directory/</a>.<br>
<br>
<h3>Line and word anchors</h3>

From the previous example, we now exclusively want to display lines starting with the string "root":<br>
<pre><code>prachya ~&gt; grep ^root /etc/passwd<br>
root:x:0:0:root:/root:/bin/bash<br>
</code></pre>

If we want to see which accounts have no shell assigned whatsoever, we search for lines ending in ":":<br>
<br>
<pre><code>prachya ~&gt; grep :$ /etc/passwd<br>
news:x:9:13:news:/var/spool/news:<br>
</code></pre>

To check that PATH is exported in ~/.bashrc, first select "export" lines and then search for lines starting with the string "PATH", so as not to display MANPATH and other possible paths:<br>
<br>
<pre><code>prachya ~&gt; grep export ~/.bashrc | grep '\&lt;PATH'<br>
  export PATH="/bin:/usr/lib/mh:/lib:/usr/bin:/usr/local/bin:/usr/ucb:/usr/dbin:$PATH"<br>
</code></pre>

Similarly, \> matches the end of a word.<br>
<br>
If you want to find a string that is a separate word (enclosed by spaces), it is better use the -w, as in this example where we are displaying information for the root partition:<br>
<br>
<pre><code>prachya ~&gt; grep -w / /etc/fstab<br>
LABEL=/                 /                       ext3    defaults        1 1<br>
</code></pre>

If this option is not used, all the lines from the file system table will be displayed.<br>
<br>
<h3>Character classes</h3>

A bracket expression is a list of characters enclosed by "[" and "]". It matches any single character in that list; if the first character of the list is the caret, "^", then it matches any character NOT in the list. For example, the regular expression "<a href='0123456789.md'>0123456789</a>" matches any single digit.<br>
<br>
Within a bracket expression, a range expression consists of two characters separated by a hyphen. It matches any single character that sorts between the two characters, inclusive, using the locale's collating sequence and character set. For example, in the default C locale, "[a-d]" is equivalent to "<a href='abcd.md'>abcd</a>". Many locales sort characters in dictionary order, and in these locales "[a-d]" is typically not equivalent to "<a href='abcd.md'>abcd</a>"; it might be equivalent to "<a href='aBbCcDd.md'>aBbCcDd</a>", for example. To obtain the traditional interpretation of bracket expressions, you can use the C locale by setting the LC_ALL environment variable to the value "C".<br>
<br>
Finally, certain named classes of characters are predefined within bracket expressions. See the grep man or info pages for more information about these predefined expressions.<br>
<br>
<pre><code>prachya ~&gt; grep [yf] /etc/group<br>
sys:x:3:root,bin,adm<br>
tty:x:5:<br>
mail:x:12:mail,postfix<br>
ftp:x:50:<br>
nobody:x:99:<br>
floppy:x:19:<br>
xfs:x:43:<br>
nfsnobody:x:65534:<br>
postfix:x:89:<br>
</code></pre>

In the example, all the lines containing either a "y" or "f" character are displayed.<br>
<br>
<h3>Wildcards</h3>

Use the "." for a single character match. If you want to get a list of all five-character English dictionary words starting with "c" and ending in "h" (handy for solving crosswords):<br>
<br>
<pre><code>prachya ~&gt; grep '\&lt;c...h\&gt;' /usr/share/dict/words<br>
catch<br>
clash<br>
cloth<br>
coach<br>
couch<br>
cough<br>
crash<br>
crush<br>
</code></pre>

If you want to display lines containing the literal dot character, use the -F option to grep.<br>
<br>
For matching multiple characters, use the asterisk. This example selects all words starting with "c" and ending in "h" from the system's dictionary:<br>
<br>
<pre><code>prachya ~&gt; grep '\&lt;c.*h\&gt;' /usr/share/dict/words<br>
caliph<br>
cash<br>
catch<br>
cheesecloth<br>
cheetah<br>
--output omitted--<br>
</code></pre>

If you want to find the literal asterisk character in a file or output, use single quotes. Cathy in the example below first tries finding the asterisk character in /etc/profile without using quotes, which does not return any lines. Using quotes, output is generated:<br>
<br>
<pre><code>prachya ~&gt; grep * /etc/profile<br>
</code></pre>

<pre><code>prachya ~&gt; grep '*' /etc/profile<br>
for i in /etc/profile.d/*.sh ; do<br>
</code></pre>

<h1>References</h1>
<ul><li><a href='http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_04_01.html#sect_04_01_01'>http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_04_01.html#sect_04_01_01</a>
<hr />
<a href='CourseSchedule2555_2.md'>กลับไปหน้าหลัก</a>-->[<a href='https://code.google.com/p/system-programming-cs3402-at-crma/wiki/CourseSchedule2555_2#ตารางเรียน_๒๕๕๕/๒'>ตารางเรียน</a>]-->Next: <a href='midtermReview.md'>ทบทวนก่อนสอบระหว่างภาค</a>
<a href='https://code.google.com/p/system-programming-cs3402-at-crma/w/edit/regularExpression'>แก้ไข</a>