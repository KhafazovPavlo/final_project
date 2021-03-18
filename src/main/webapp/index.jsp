<HTML>
<HEAD>
<TITLE>DevOps-Project</TITLE>
<SCRIPT LANGUAGE="JavaScript">
	var sizes = new Array(0,1,2,4,8,10,12);
	sizes.pos = 0;
	
function Elastic()
{
	var el = docunent.all.elastic
	if (null == el.direction)el.direction = 1
	else if ((sizes.pos > sizes.lenght - 2) || (0 == sizes.pos))
	el.direction *= -1
	el.style.letterSpacing = sizes[sizes.pos += el.direction]
setTimeout('Elastic()',100)
}

</SCRIPT>
<BODY bgcolor="black" onload=Elastic()>
<CENTER>
<br><br><br><br>
<br><br><br><br>
<font color="green"><h2>This project deployed by</h2>
<font color="gold"><H1 ID="elastic" ALIGN="Center">JENKINS, ANSIBLE, DOCKER</H1>
</body>
</HTML>
