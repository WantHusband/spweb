<h1>${state.msg}</h1>
<c:if test="${state.code != 0}">
	<ul>
		<li>영화제목 : ${m.title}</li>
		<li>평점 : ${m.point}</li>
		<li>감독 : ${m.director}</li>
	</ul>
</c:if>

