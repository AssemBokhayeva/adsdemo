select  spend, null as conv,
        impressions as imps,
        clicks, channel,
        date, campaign_id, engagements
from `project-for-ads-421207.dbt_abokhayeva.src_promoted_tweets_twitter_all_data`

union all

select spend, conv,
       imps,
       clicks, channel,
       date, campaign_id, null as engagements
from `project-for-ads-421207.dbt_abokhayeva.src_ads_bing_all_data` 

union all 

select spend,purchase as conv,
       impressions as imps,
       clicks, channel,
       date, campaign_id, 
       (sum(comments)+sum(shares)+sum(likes)+sum(clicks)+sum(views)) as engagements ,
from `project-for-ads-421207.dbt_abokhayeva.src_ads_creative_facebook_all_data`
group by spend,purchase,
       impressions,
       clicks, channel,
       date, campaign_id

union all

select spend,
      conversions as conv,
      impressions as imps, 
      clicks, channel,
      date, campaign_id,
      null as engagements
from `project-for-ads-421207.dbt_abokhayeva.src_ads_tiktok_ads_all_data`