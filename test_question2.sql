select u.Email 
from [User] u 
inner join UserLanguage ul on u.UserId = ul.UserId
left join Languages l on l.LanguageId = ul.LanguageId
where u.Registered < GETDATE()
AND  u.Registered >= DATEADD(week,-1,GETDATE())
AND l.Name = 'French' -- I wasn't sure if I should have used the name or look by the ID
AND ul.Rating >= 4