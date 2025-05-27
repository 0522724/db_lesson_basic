<Q1>
CREATE TABLE departments (
  departments_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


<Q2>
ALTER TABLE people
ADD departments_id INT unsigned AFTER email;


<Q3>
INSERT INTO departments(name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people(name,email,departments_id,age,gender)
VALUES
('中原 麻理','nakahara@beyond-works.co.jp',1,34,2),
('井垣 華','igaki@beyond-works.co.jp',1,24,2),
('吉川 未花','yoshikawa@beyond-works.co.jp',1,27,2),
('嶋田 里奈','shimada@beyond-works',2,27,2),
('田中 太郎','t-tanaka@beyond-works',2,30,1),
('鈴木 一郎','i-suzuki@beyond-works',2,51,1),
('佐藤 栞里','satou@beyond-works',2,34,2),
('阿部 寛','abe@beyond-works',3,60,1),
('中川 翔子','nakagawa@beyond-works',4,40,2),
('藤森 慎吾','huzimori@beyond-works',5,42,1);

INSERT INTO reports(person_id,content)
VALUES
(7,'夏休みの予定'),
(8,'豊洲に行った'),
(9,'テスト実行について'),
(10,'食べてばっかり'),
(11,'今日の予定'),
(12,'野球について'),
(13,'色んな番組で見る'),
(14,'ドラマ面白い'),
(15,'いつまでも若い'),
(16,'チャラい');


<Q4>
UPDATE people SET departments_id = 3 WHERE person_id = 1;
UPDATE people SET departments_id = 4 WHERE person_id IN (2,3);
UPDATE people SET departments_id = 5 WHERE person_id IN (4,6);


-- UPDATE people SET departments_id = CASE person_id
-- WHEN 1 THEN 5
-- WHEN 2 THEN 5
-- WHEN 3 THEN 4
-- WHEN 4 THEN 4
-- WHEN 6 THEN 3
-- END
-- WHERE person_id IN (1,2,3,4,6);


<Q5>
SERECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;


<Q6>
departments_idが1のレコードを持つ人を対象に、
peopleというテーブルから、
name,email,ageというカラムを
作成順に取得したい
(departments_idが1に割り振られている人の名前、メールアドレス、年齢を作成日時順に取得したい)

-- name,email,ageというカラムを取得したい
-- peopleというテーブルから
-- departments_idが1のレコードを持つ人を対象に
-- 作成日時順に


<Q7>
SELECT name FROM people WHERE (gender = 2 AND age BETWEEN 20 AND 29)
OR (gender = 1 AND age BETWEEN 40 AND 49);


<Q8>
SELECT name,age FROM people WHERE departments_id = 1 ORDER BY age ASC;


<Q9>
SELECT gender, AVG(age) AS average_age FROM people WHERE gender = 2;


<Q10>
SELECT p.name, d.name, r.content
FROM people p JOIN departments d USING (departments_id)
JOIN reports r USING (person_id);

-- SELECT people.name, departments.name, reports.content
-- FROM people INNER JOIN departments ON people.departments_id = departments.departments_id
-- INNER JOIN reports ON people.person_id = reports.person_id;


<Q11>
SELECT p.name, r.content
FROM people p LEFT OUTER JOIN reports r USING (person_id)
WHERE r.content IS NULL;

SELECT people.name, reports.content
FROM people LEFT OUTER JOIN reports USING (person_id)
WHERE reports.content IS NULL;