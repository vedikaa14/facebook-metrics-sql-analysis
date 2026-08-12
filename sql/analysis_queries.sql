
1)How many total posts are there?
SELECT  COUNT(*) as number_of_post
 FROM facebook_metrics;
  
2)What are the different post types?
   SELECT distinct Type
   FROM facebook_metrics;

3)How many posts are there are of each type ?
  select count(*) as number_of_photos_as_post
  from facebook_metrics
  where type='Photo';
  
 select count(*) as number_of_link_as_post
 from facebook_metrics
 where type='link';
 
 select count(*) as number_of_status_as_post
 from facebook_metrics
 where type='status';
 
  select count(*) as number_of_video_as_post
 from facebook_metrics
 where type='video';

4)What is the highest number of likes?
 select max(likes) as max_likes from facebook_metrics;

5)What is the average number of likes?
select avg(likes) as avg_likes from facebook_metrics;
  
6)Which post has the highest shares?
SELECT 
    id,
    type,
    shares
FROM facebook_metrics
ORDER BY shares DESC
LIMIT 1;


7)Which post has the highest comments?
SELECT 
    id,
    type,
    comments
FROM facebook_metrics
ORDER BY comments DESC
LIMIT 1;

8)How many posts are there for each post type?
SELECT 
    type,
    COUNT(*) AS number_of_posts
FROM facebook_metrics
GROUP BY type;

9) What is the average likes for each post type?
SELECT 
    type,
    AVG(likes) AS average_likes
FROM facebook_metrics
GROUP BY type;

10) What is the average shares for each post type?
SELECT 
    type,
    AVG(shares) AS average_shares
FROM facebook_metrics
GROUP BY type;

11) What is the total interaction for each post type?
SELECT 
    type,
    SUM(total_interactions) AS total_interaction
FROM facebook_metrics
GROUP BY type;


12) How many posts were paid?
SELECT 
    paid,
    COUNT(*) AS number_of_posts
FROM facebook_metrics
GROUP BY paid;

13)Do paid posts have higher average engagement?
SELECT 
    paid,
    AVG(total_interactions) AS average_engagement
FROM facebook_metrics
GROUP BY paid;

14) Which month had the highest number of posts?
SELECT 
    post_month,
    COUNT(*) AS number_of_posts
FROM facebook_metrics
GROUP BY post_month
ORDER BY number_of_posts DESC
LIMIT 1;

15)Which weekday had the highest average interactions?
SELECT 
    post_weekday,
    AVG(total_interactions) AS avg_weekday_interaction
FROM facebook_metrics
GROUP BY post_weekday
ORDER BY avg_weekday_interaction DESC
LIMIT 1;

16) Which posting hour has the highest average likes?
SELECT 
    post_hour,
    AVG(likes) AS avg_likes_post_hours
FROM facebook_metrics
GROUP BY post_hour
ORDER BY avg_likes_post_hours DESC
LIMIT 1;

17) Find posts whose likes are above the overall average?
SELECT
    id,
    type,
    likes
FROM facebook_metrics
WHERE likes > (
    SELECT AVG(likes)
    FROM facebook_metrics
);

18) Find the top 10 posts based on total interactions?
SELECT
    id,
    type,
    total_interactions
FROM facebook_metrics
ORDER BY total_interactions DESC
LIMIT 10;
Concept

19) Rank all posts based on likes
SELECT
    id,
    type,
    likes,
    RANK() OVER (
        ORDER BY likes DESC
    ) AS like_rank
FROM facebook_metrics;

20) Find the top-performing post for each post type

SELECT
    id,
    type,
    total_interactions
FROM (
    SELECT
        id,
        type,
        total_interactions,
        ROW_NUMBER() OVER (
            PARTITION BY type
            ORDER BY total_interactions DESC
        ) AS rn
    FROM facebook_metrics
) AS ranked_posts
WHERE rn = 1;


21)Find the month with the highest average interactions?
SELECT
    post_month,
    AVG(total_interactions) AS avg_interactions
FROM facebook_metrics
GROUP BY post_month
ORDER BY avg_interactions DESC
LIMIT 1;


22)Compare paid vs unpaid posts for reach, likes, shares and comments
SELECT
    CASE
        WHEN paid = 1 THEN 'Paid'
        ELSE 'Unpaid'
    END AS post_category,
    AVG(reach) AS avg_reach,
    AVG(likes) AS avg_likes,
    AVG(shares) AS avg_shares,
    AVG(comments) AS avg_comments
FROM facebook_metrics
GROUP BY paid;


23)Classify posts as High, Medium, Low engagement using CASE
SELECT
    id,
    type,
    total_interactions,
    CASE
        WHEN total_interactions >= 1000 THEN 'High'
        WHEN total_interactions >= 500 THEN 'Medium'
        ELSE 'Low'
    END AS engagement_level
FROM facebook_metrics;




