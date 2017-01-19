select u.UserId, u.Email, Count(LanguageId) as TotalLanguages
from [User] u 
left join UserLanguage ul on u.UserId = ul.UserId
group by u.UserId, u.Email
