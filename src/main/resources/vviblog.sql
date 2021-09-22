/*
 Navicat Premium Data Transfer

 Source Server         : mysql{本地}
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : vviblog

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 22/09/2021 15:09:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  `watch` int(255) DEFAULT '0',
  `star` int(255) DEFAULT '0',
  `is_delete` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (1, '测试', 'vvi', '测试', '欢迎使用Markdown编辑器写博客本Markdown编辑器使用StackEdit修改而来，用它写博客，将会带来全新的体验哦：Markdown和扩展Markdown简洁的语法代码块高亮图片链接和图片上传LaTex数学公式UML序列图和流程图离线写博客', '2021-09-22 14:40:14', '2021-09-22 14:40:14', '<h1 id=\"欢迎使用markdown编辑器写博客\">欢迎使用Markdown编辑器写博客</h1>\r\n<p>本Markdown编辑器使用<a href=\"https://github.com/benweet/stackedit\">StackEdit</a>修改而来，用它写博客，将会带来全新的体验哦：</p>\r\n<ul>\r\n<li><strong>Markdown和扩展Markdown简洁的语法</strong></li>\r\n<li><strong>代码块高亮</strong></li>\r\n<li><strong>图片链接和图片上传</strong></li>\r\n<li><strong><em>LaTex</em>数学公式</strong></li>\r\n<li><strong>UML序列图和流程图</strong></li>\r\n<li><strong>离线写博客</strong></li>\r\n<li><strong>导入导出Markdown文件</strong></li>\r\n<li><strong>丰富的快捷键</strong></li>\r\n</ul>\r\n<hr />\r\n<h2 id=\"快捷键\">快捷键</h2>\r\n<ul>\r\n<li>加粗&nbsp;<code>Ctrl + B</code></li>\r\n<li>斜体&nbsp;<code>Ctrl + I</code></li>\r\n<li>引用&nbsp;<code>Ctrl + Q</code></li>\r\n<li>插入链接&nbsp;<code>Ctrl + L</code></li>\r\n<li>插入代码&nbsp;<code>Ctrl + K</code></li>\r\n<li>插入图片&nbsp;<code>Ctrl + G</code></li>\r\n<li>提升标题&nbsp;<code>Ctrl + H</code></li>\r\n<li>有序列表&nbsp;<code>Ctrl + O</code></li>\r\n<li>无序列表&nbsp;<code>Ctrl + U</code></li>\r\n<li>横线&nbsp;<code>Ctrl + R</code></li>\r\n<li>撤销&nbsp;<code>Ctrl + Z</code></li>\r\n<li>重做&nbsp;<code>Ctrl + Y</code></li>\r\n</ul>\r\n<h2 id=\"markdown及扩展\">Markdown及扩展</h2>\r\n<blockquote>\r\n<p>Markdown 是一种轻量级标记语言，它允许人们使用易读易写的纯文本格式编写文档，然后转换成格式丰富的HTML页面。 &mdash;&mdash;&nbsp;<a href=\"https://zh.wikipedia.org/wiki/Markdown\" target=\"_blank\" rel=\"noopener noreferrer\">[ 维基百科 ]</a></p>\r\n</blockquote>\r\n<p>使用简单的符号标识不同的标题，将某些文字标记为<strong>粗体</strong>或者<em>斜体</em>，创建一个<a href=\"http://www.csdn.net/\">链接</a>等，详细语法参考帮助？。</p>\r\n<p>本编辑器支持&nbsp;<strong>Markdown Extra</strong>&nbsp;, 　扩展了很多好用的功能。具体请参考<a title=\"Pagedown Extra\" href=\"https://github.com/jmcmanus/pagedown-extra\">Github</a>.</p>\r\n<h3 id=\"表格\">表格</h3>\r\n<p><strong>Markdown　Extra</strong>　表格语法：</p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th>项目</th>\r\n<th>价格</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>Computer</td>\r\n<td>$1600</td>\r\n</tr>\r\n<tr>\r\n<td>Phone</td>\r\n<td>$12</td>\r\n</tr>\r\n<tr>\r\n<td>Pipe</td>\r\n<td>$1</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>可以使用冒号来定义对齐方式：</p>\r\n<table>\r\n<thead>\r\n<tr>\r\n<th align=\"left\">项目</th>\r\n<th align=\"right\">价格</th>\r\n<th align=\"center\">数量</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td align=\"left\">Computer</td>\r\n<td align=\"right\">1600 元</td>\r\n<td align=\"center\">5</td>\r\n</tr>\r\n<tr>\r\n<td align=\"left\">Phone</td>\r\n<td align=\"right\">12 元</td>\r\n<td align=\"center\">12</td>\r\n</tr>\r\n<tr>\r\n<td align=\"left\">Pipe</td>\r\n<td align=\"right\">1 元</td>\r\n<td align=\"center\">234</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h3 id=\"定义列表\">定义列表</h3>\r\n<p><strong>Markdown　Extra</strong></p>\r\n<dl>　定义列表语法： 项目１ 项目２\r\n<dd>定义 A</dd>\r\n<dd>定义 B</dd>\r\n项目３\r\n<dd>定义 C</dd>\r\n<dd>\r\n<p>定义 D</p>\r\n<blockquote>\r\n<p>定义D内容</p>\r\n</blockquote>\r\n</dd>\r\n</dl>\r\n<h3 id=\"代码块\">代码块</h3>\r\n<p>代码块语法遵循标准markdown代码，例如：</p>\r\n<pre class=\"prettyprint\"><code class=\"language-python hljs \"><span class=\"hljs-decorator\">@requires_authorization</span>\r\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">def</span> <span class=\"hljs-title\">somefunc</span><span class=\"hljs-params\">(param1=<span class=\"hljs-string\">\'\'</span>, param2=<span class=\"hljs-number\">0</span>)</span>:</span>\r\n    <span class=\"hljs-string\">\'\'\'A docstring\'\'\'</span>\r\n    <span class=\"hljs-keyword\">if</span> param1 &gt; param2: <span class=\"hljs-comment\"># interesting</span>\r\n        <span class=\"hljs-keyword\">print</span> <span class=\"hljs-string\">\'Greater\'</span>\r\n    <span class=\"hljs-keyword\">return</span> (param2 - param1 + <span class=\"hljs-number\">1</span>) <span class=\"hljs-keyword\">or</span> <span class=\"hljs-keyword\">None</span>\r\n<span class=\"hljs-class\"><span class=\"hljs-keyword\">class</span> <span class=\"hljs-title\">SomeClass</span>:</span>\r\n    <span class=\"hljs-keyword\">pass</span>\r\n<span class=\"hljs-prompt\">&gt;&gt;&gt; </span>message = <span class=\"hljs-string\">\'\'\'interpreter\r\n<span class=\"hljs-prompt\">... </span>prompt\'\'\'</span></code></pre>\r\n<h3 id=\"脚注\">脚注</h3>\r\n<p>生成一个脚注<a id=\"fnref:footnote\" class=\"footnote\" title=\"See footnote\" href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#fn:footnote\">1</a>.</p>\r\n<h3 id=\"目录\">目录</h3>\r\n<p>用&nbsp;<code>[TOC]</code>来生成目录：</p>\r\n<p>&nbsp;</p>\r\n<div class=\"toc\">\r\n<ul>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#%E6%AC%A2%E8%BF%8E%E4%BD%BF%E7%94%A8markdown%E7%BC%96%E8%BE%91%E5%99%A8%E5%86%99%E5%8D%9A%E5%AE%A2\">欢迎使用Markdown编辑器写博客</a>\r\n<ul>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#%E5%BF%AB%E6%8D%B7%E9%94%AE\">快捷键</a></li>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#markdown%E5%8F%8A%E6%89%A9%E5%B1%95\">Markdown及扩展</a>\r\n<ul>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#%E8%A1%A8%E6%A0%BC\">表格</a></li>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#%E5%AE%9A%E4%B9%89%E5%88%97%E8%A1%A8\">定义列表</a></li>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#%E4%BB%A3%E7%A0%81%E5%9D%97\">代码块</a></li>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#%E8%84%9A%E6%B3%A8\">脚注</a></li>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#%E7%9B%AE%E5%BD%95\">目录</a></li>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F\">数学公式</a></li>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#uml-%E5%9B%BE\">UML 图:</a></li>\r\n</ul>\r\n</li>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#%E7%A6%BB%E7%BA%BF%E5%86%99%E5%8D%9A%E5%AE%A2\">离线写博客</a></li>\r\n<li><a href=\"https://blog.csdn.net/weixin_42831477/article/details/81280582#%E6%B5%8F%E8%A7%88%E5%99%A8%E5%85%BC%E5%AE%B9\">浏览器兼容</a></li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</div>\r\n<p>&nbsp;</p>\r\n<h3 id=\"数学公式\">数学公式</h3>\r\n<p>使用MathJax渲染<em>LaTex</em>&nbsp;数学公式，详见<a href=\"http://math.stackexchange.com/\">math.stackexchange.com</a>.</p>\r\n<ul>\r\n<li>行内公式，数学公式为：。</li>\r\n<li>块级公式：</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<div class=\"MathJax_Display\">&nbsp;</div>\r\n<p>&nbsp;</p>\r\n<p>更多LaTex语法请参考&nbsp;<a href=\"http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference\">这儿</a>.</p>\r\n<h3 id=\"uml-图\">UML 图:</h3>\r\n<p>可以渲染序列图：</p>\r\n<div class=\"sequence-diagram\">张三张三李四李四嘿，小四儿, 写博客了没?李四愣了一下，说：忙得吐血，哪有时间写。</div>\r\n<p>或者流程图：</p>\r\n<div class=\"flow-chart\">开始我的操作确认？结束yesno</div>\r\n<ul>\r\n<li>关于&nbsp;<strong>序列图</strong>&nbsp;语法，参考&nbsp;<a href=\"http://bramp.github.io/js-sequence-diagrams/\">这儿</a>,</li>\r\n<li>关于&nbsp;<strong>流程图</strong>&nbsp;语法，参考&nbsp;<a href=\"http://adrai.github.io/flowchart.js/\">这儿</a>.</li>\r\n</ul>\r\n<h2 id=\"离线写博客\">离线写博客</h2>\r\n<p>即使用户在没有网络的情况下，也可以通过本编辑器离线写博客（直接在曾经使用过的浏览器中输入<a href=\"http://write.blog.csdn.net/mdeditor\">write.blog.csdn.net/mdeditor</a>即可。<strong>Markdown编辑器</strong>使用浏览器离线存储将内容保存在本地。</p>\r\n<p>用户写博客的过程中，内容实时保存在浏览器缓存中，在用户关闭浏览器或者其它异常情况下，内容不会丢失。用户再次打开浏览器时，会显示上次用户正在编辑的没有发表的内容。</p>\r\n<p>博客发表后，本地缓存将被删除。　</p>\r\n<p>用户可以选择&nbsp;把正在写的博客保存到服务器草稿箱，即使换浏览器或者清除缓存，内容也不会丢失。</p>\r\n<blockquote>\r\n<p><strong>注意：</strong>虽然浏览器存储大部分时候都比较可靠，但为了您的数据安全，在联网后，<strong>请务必及时发表或者保存到服务器草稿箱</strong>。</p>\r\n</blockquote>\r\n<h2 id=\"浏览器兼容\">浏览器兼容</h2>\r\n<ol>\r\n<li>目前，本编辑器对Chrome浏览器支持最为完整。建议大家使用较新版本的Chrome。</li>\r\n<li>IE９以下不支持</li>\r\n<li>IE９，１０，１１存在以下问题<br />\r\n<ol>\r\n<li>不支持离线功能</li>\r\n<li>IE9不支持文件导入导出</li>\r\n<li>IE10不支持拖拽文件导入</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<hr />\r\n<div class=\"footnotes\">&nbsp;</div>', 0, 0, NULL);
INSERT INTO `article` VALUES (2, '缘起则聚，缘灭则散', 'vvi', '散文', '\0\0夜，结束了一天的喧嚣后安静下来，伴随着远处路灯那微弱的光。风，毫无预兆地席卷整片旷野，撩动人的思绪万千。星，遥遥地挂在天空之中，闪烁着它那微微星光，不如阳光般灿烂却如花儿般如痴如醉。\0\0——题记\0\0欲将沉醉换悲凉，清歌莫断肠。这混乱的尘世，究竟充', '2021-09-22 14:43:07', '2021-09-22 14:43:07', '<p>　　夜，结束了一天的喧嚣后安静下来，伴随着远处路灯那微弱的光。风，毫无预兆地席卷整片旷野，撩动人的思绪万千。星，遥遥地挂在天空之中，闪烁着它那微微星光，不如阳光般灿烂却如花儿般如痴如醉。</p>\r\n<p>　　&mdash;&mdash;题记</p>\r\n<p>　　欲将沉醉换悲凉，清歌莫断肠。这混乱的尘世，究竟充斥了多少绝望和悲伤。你想去做一个勇敢的男子，为爱，为信仰，轰轰烈烈的奋斗一场。你周身充斥着无人可比的灵气和光芒。你有着与伟人比肩的才气和名声，你是那样高傲孤洁的男子。你的一寸狂心未说，已经几度黄昏雨。</p>\r\n<p>　　曾经以为，相爱的人一定要相守，只有相守，情感才能长久。可是，此岸和彼岸只不过是空间的差距，却无法拉长心灵的距离。</p>\r\n<p>　　时光荏苒，岁月无声。日子不紧不慢的如涓涓溪水静静的流去，而从身边流去的只有时光，沉淀下来的是与你一路相伴的幸福和快乐，温馨和安暖。于我，在这个凋零都感受到诗意横溢的秋，只想做一件事，拈一片绯红的枫叶，轻轻地刻上我的心语。对信仰，是我今生永不改变的主题！而后，幸福的寄往有你的那个城市。从此，在我心里，于我的生命里，轻握你许的安暖，静静地在岁月的彼岸，为你守候一世永恒！</p>\r\n<p>　　一段情，反复的掂量，最后加深了岁月的绵长。一路追赶里，一路追忆里，最后得到的是什么，最后又失去的是什么。或许，只有我们在静思的时候才会明白，这路的追忆里，我们得到的快乐往往比痛苦要少。当相思成殇的时候，除了对月徒悲叹之外，什么也不曾抓到。</p>\r\n<p>　　一直执着于生命的简约格调，只愿用一颗淡然的心看云卷云舒，看季节更迭。许多不合时节的事物，必然会被光阴遗落，就像曾经繁茂的秋叶，待生命枯竭，终将脱离叶脉的相系相牵。而我，一直在这里，抖落一身的负累，永恒以树的姿态站立于季风中，昂首向着那无边温暖的碧蓝晴空。</p>\r\n<p>　　夜幕降临了，春雨柔柔的亲吻着薄如蝉翼的纱帘，有节奏的淅沥在窗棂上，更增添了无限的意念。意念中的我，在幸福和恬淡中，漫捻心弦化为若水般的轻柔曼妙在深情的雨夜里。此刻，窗外的雨不再是清冷的秋雨了，在我的眸里是一种柔软，似撒娇少女的情怀，是怜、是爱、是柔、是润在我的心里是一种憧憬，憧憬着一份美好的未来，与你相拥在花雨飘飞的时节，让爱情肆意的怒放在油纸伞下，青石边，丁香小巷这样的心境，这样的时光，这样的时刻，心不经意间便醉了、醉了、醉在这如曼妙轻盈舞步的秋雨中</p>\r\n<p>　　晚霞破月的天际，依旧映红了归家的路途，流浪了好久的笔调写满了疲倦的素笺，伴着枯萎的憔悴，与年华斑驳的碎影相逢，溅起涟漪在心田的几缕游丝浅叹，让年华牵住执笔的手，静听潺潺流水；波动在逐流的心海，唤名为；婆娑年华，勾勒了谁的斑驳唯有情醉琉璃一宿，又是一个不眠的夜。</p>\r\n<p>　　真正的相爱，是人在千里，却梦魂相依；真正的相爱，是岁月流转，却不离不弃；真正的相爱，是彼此付出，却无怨无悔。</p>\r\n<p>　　樱花有单樱和双樱，她们绽放时满树灿烂，清香扑鼻，单樱白的如雪如云，双樱色彩如火似霞。但是无论是单樱还是双樱，她们盛开的时间都不长，二十多天的光景，开的绚丽多彩、满树烂漫，落得星星瓣瓣，匆匆忙忙。</p>\r\n<p>　　深秋还远，徐徐的风吹着，却也有了几分萧瑟，春天，不仅有满天飘飞的花儿，还有到处弥散着花的幽香。随着秋韵渐渐浓郁起来，院子里的花便盛开了，整个院子里香气四溢，溢漫着甜丝丝的味儿。金灿的花儿一串串、一撮撮，重重叠叠簇涌着点缀在茂密的绿叶之间，温温暖暖象极了一个个孩子的笑脸，仿佛是给这温暖的春天注入了一道亮丽的风景。</p>\r\n<p>　　指尖轻触玻窗，嗤嗤的响声，惊动了脆弱的心脏，一阵阵的酸楚，像浪潮般袭来，若果这样酸酸的痛可以代替撕心裂肺，那就让他长久点，这样时间会把我忘记，这样便可躲在这里，让那些软弱手舞足蹈，让那些脆弱和不堪拼命娱乐，让那颗紧绷的心，少少松弦。</p>\r\n<p>　　曾过往，伊颜纯美无暇，如玉般璀璨，许多人像发现了财富，紧抱于怀，怜香般害怕失去。那时，遇见你的是洗礼过后的悔过者，只懂怜香，而不懂惜玉，再璀璨也掩盖不了他身上久积的灰尘，铸造不了你，也成就不了他，于是乎，迷糊坚固了戏剧化的情谊，疼只是简单的疼。</p>\r\n<p>　　有人曾说，会白首不相离。可是终究一口空言，转眼，便抛之彼岸。可是，我却一直相信着。然后，在追逐的沿途，荆棘布满，却一直从未低头</p>\r\n<p>　　原来有些等待是不值得的，那么多年换来的却是沧海桑田，我们只是沧海一粟，不能左右命运给予的奇迹与苦楚，面对些许，能做的也许只剩下了等待，可是等待却又是需要勇气，更要有勇气来承担与等待而来的结果大相径庭的结果。</p>\r\n<p>　　思绪渺渺，发怀古之悲情，世间种种，诱愁之决堤，三山五岳，撼天地之威名，流水之昌吉，涓涓之柔情，不禁闲情满溢。</p>\r\n<p>　　人生自是有情痴，此恨不关风与月。谁为谁真情缱绻？谁为谁痴傻疯狂？谁为谁望穿秋水？谁为谁痛彻心扉？都是你我解不开的白线团。无缘何生斯世，有情能累此生。</p>\r\n<p>　　相思成为了很多人生命里的一种自我安慰，在月圆的时候无尽思念，在月缺的时候无限惆怅，想念着岁月里和情有关的所有悲欢离合。在情感的世界里，我们一直带着所有的铿锵前行，不管风雨肆虐，不管风和日丽。</p>\r\n<p>　　染窗前。那堪清风曲径，不似甚似还满。份外湮留韶华，时节正乱红，空留余恨。淡眉醉眼，红妆轻粉，旧时依恋尘缘。只皓月朗朗，乾坤转，故国山川。次第红颜，疑是讴歌回畔。</p>\r\n<p>　　生命中；总有太多的遗憾要留给回忆，年华里；屡不清的斑驳，总是勾勒了无数支离破碎的心伤。太多的执着所放不下，只是；那一份不屈的痛过，不期而遇的却是最美的意外。文字依旧可以华美朴实，年华不可唯美梦境，快乐不是一件不可奢侈的事情，忧伤，而往往是一度的颓废。</p>\r\n<p>　　人生的路途，经历无数的驿站之后，总会出现陌生或熟悉的风景。时间所说的过客，只是注定走过的人和事，没有太多是刻意要去记住或淡忘的。铺就在黑白交错里的，无非就是忧伤曾穿越过的黑暗，在记忆的角落里，诉说了全部的待续。那些停驻在指尖的薄凉，是曾绽放在年华里的微碎。</p>\r\n<p>　　指间年华，渲染着无暇斑驳的彩塑，悲伤的城池依旧提笔挥墨，画下四季风吹过的无痕。微笑掩饰了寂寞过的眼泪，是因为，在婆娑的年华里，聆听着没有人的相伴相知。那些了不断的往事，是梦绕在悲伤情愫深处，盈满心扉的最初和凝眸的叹息。终不过似水流年，清风凄语，唯独旧梦难拾。</p>', 0, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (1, 2, 1, NULL, NULL, NULL, NULL, '魅族天下第一', '2021-09-22 14:43:59', NULL);
INSERT INTO `comment` VALUES (2, 2, 1, NULL, NULL, 1, NULL, '真的假的', '2021-09-22 14:44:11', NULL);
INSERT INTO `comment` VALUES (3, 2, 1, NULL, NULL, 1, 2, '当然是真的', '2021-09-22 15:03:45', NULL);
COMMIT;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend` (
  `friend_id` int(255) NOT NULL AUTO_INCREMENT,
  `friend_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of friend
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `activation_code` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(255) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'vvi', 'vvi123', '管理员', '/static/images/head/head.jpg', '0', 1, '1053213227@qq.com');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
