<?php
function smarty_function_rss_generate($params,&$smarty)
{
        require_once(INCLUDE_DIR.'/feedcreator.class.php');
print_r($params);

        $rss =& new UniversalFeedCreator();
        $rss->title = $params['data']['global']['title'];
        $rss->description = $params['data']['global']['description'];
        $rss->link = $params['data']['global']['link'];


        foreach ($params['data']['items'] as $item)
        {
                $item =& new FeedItem();
                $item->title = $item['title'];
                $item->link = $item['link'];
                $item->description = $item['description'];
                $rss->addItem($item);
        }

        $smarty->assign('rss_generate',$rss->createFeed());
}
?>