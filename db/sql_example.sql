SELECT name
FROM authors
WHERE email = "shakespeare@example.com";

SELECT name
FROM authors
ORDER BY created_at DESC
LIMIT 1;

SELECT question_type, COUNT(*) AS count_duplicate
FROM questions
GROUP BY question_type
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC

SELECT response_text, COUNT(*) AS 'response_occurence'
FROM responses
GROUP BY response_text
ORDER BY COUNT(*) DESC
WHERE question_id = 3;

SELECT title, email
FROM surveys LEFT JOIN authors
ON surveys.author_id=authors.id
WHERE surveys.author_id IS NULL;
