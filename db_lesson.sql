Q1:
CREATE TABLE 
   `departments`(
     -> department_id int unsigned auto_increment primary key NOT NULL,
     -> name VARCHAR(20) NOT NULL,
     -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
     -> );

Q2:
ALTER TABLE 
   people 
ADD 
   COLUMN department_id 
INT 
   unsigned 
AFTER 
   email;

Q3:
//追加する部署一覧//
INSERT INTO 
   departments (name)
    -> VALUES
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');

//追加する人の条件//
INSERT INTO 
    people (name, email, age, gender,department_id)
    -> VALUES
    -> ('小林拓郎', 'kobayashi@beyond-works.co.jp', 33, 1, 1),
    -> ('佐川美琴', 'sagawa@beyond-works.co.jp', 56, 2, 1),
    -> ('井野辺ゆう', 'inobe@beyond-works.co.jp', 26, 2, 1),
    -> ('田上司', 'tagami@beyond-works.co.jp', 45, 1, 2),
    -> ('柿原裕二', 'kakihara@beyond-works.co.jp', 61, 1, 2),
    -> ('早乙女朱里', 'saotome@beyond-works.co.jp', 33, 2, 2),
    -> ('河野すず', 'kawano@beyond-works.co.jp', 37, 2, 2),
    -> ('榎本恵理', 'enomoto@beyond-works.co.jp', 42, 2, 3),
    -> ('岡部剛', 'okabe@beyond-works.co.jp', 25, 1, 4),
    -> ('畠山重幸', 'hatakeyama@beyond-works.co.jp', 38, 1, 5);

//追加する日報の条件//
INSERT INTO 
    reports (person_id, content)
    -> VALUES
    -> (1, 'ああああああああああ'),
    -> (1, 'ええええええええええええええ'),
    -> (1, 'そそそそそそそそそそそ'),
    -> (2, 'にこにこにこにこにこにこ'),
    -> (3, 'ままままっまっままままままっまっま'),
    -> (3, 'おやおやおやおやおやおやおやおやおや'),
    -> (4, 'だだだだだだだだだだだだ'),
    -> (4, 'すすすすすすすすすすすすすす'),
    -> (4, 'ふふふふふふふふふふふふうふふ'),
    -> (6, 'ここここおこここおここここここここ');

Q4:
UPDATE 
   people 
SET 
   department_id = 1 
WHERE 
   person_id = '1';

UPDATE 
   people 
SET 
   department_id = 2 
WHERE 
   person_id = '2';

UPDATE 
   people 
SET 
   department_id = 3 
WHERE 
   person_id = '3';

UPDATE 
   people 
SET 
   department_id = 4 
WHERE 
   person_id = '4';

UPDATE 
   people 
SET 
   department_id = 6 
WHERE 
   person_id = '5';

Q5:
SELECT 
   name, age 
FROM 
   people 
WHERE 
   gender = '1' 
ORDER BY age DESC;

Q6:テーブル・レコード・カラムという3つの単語を適切に使用して、下記のSQL文を日本語で説明してください。
peopleテーブルから部署IDカラムが1に該当する、名前、メールアドレス、年齢のレコードを作成日時の昇順で取り出す

Q7:
SELECT 
   name 
FROM 
   people 
WHERE 
   gender = 2 
AND 
   age BETWEEN 20 and 29 
OR 
   gender = 1 
AND 
   age BETWEEN 40 and 49;

Q8:
SELECT 
   * 
FROM 
   people 
WHERE 
   department_id = 1 
ORDER BY 
   age ASC;

Q9:
SELECT 
   AVG(age) 
AS 
   average_age 
FROM 
   people 
WHERE 
   gender = 2 
AND 
   department_id = 2;

Q10:
SELECT 
   people.name, departments.name, reports.content 
FROM 
   people
INNER JOIN 
   reports 
ON 
   people.person_id = reports.person_id
INNER JOIN 
   departments 
ON 
   people.department_id = departments.department_id;

Q11:
SELECT 
   people.name 
FROM 
   people 
LEFT OUTER JOIN 
   reports 
USING 
   (person_id)  
WHERE 
   reports.content IS NULL;
