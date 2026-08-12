create database facebook_metrics;
use facebook_metrics;
CREATE TABLE facebook_metrics (
    id INT,
    page_total_likes INT,
    type VARCHAR(50),
    category INT,
    post_month INT,
    post_weekday INT,
    post_hour INT,
    paid BOOLEAN,
    lifetime_post_total_reach INT,
    lifetime_post_total_impressions INT,
    lifetime_engaged_users INT,
    lifetime_post_consumers INT,
    lifetime_post_consumptions INT,
    lifetime_post_impressions_likers INT,
    lifetime_post_reach_likers INT,
    lifetime_likers_engaged INT,
    comments INT,
    likes INT,
    shares INT,
    total_interactions INT
);
