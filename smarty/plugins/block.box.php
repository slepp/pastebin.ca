<?php
function smarty_block_box($params, $content, &$smarty, &$repeat) {
    static $sec = 0;
    if(!$repeat) {
        # $first = ($sec==0?'first':'second');
        $first = 'first';
        $output  =<<< EOF
  <div id="idsec$sec" class="section">
    <div class="$first" ondblclick="javascript:showHideDiv('idsec$sec-collapse',this,'5050b4')">
    <h2 class="first">
      <img src="http://static.pastebin.ca/imgs/svg.php/arrow-up-12-5050b4.png"
           style="width:12px;height:12px;float:right;margin-bottom:0.25em;margin-top:0.25em;padding:2px"
           onclick="javascript:showHideDiv('idsec$sec-collapse',this,'5050b4')" alt="" />
      <script type="text/javascript">showhideobj['idsec$sec'] = 'block';</script>
EOF;
        if(isset($params['subtitle'])) {
            $output .= <<< EOF
      <dl class="bookend h2">
         <dt>{$params['title']}</dt>
         <dd>{$params['subtitle']}</dd>
      </dl>
EOF;
        } else {
            $output .= $params['title'];
        }
        $output .= <<< EOF
    </h2>
    </div>
    <div id="idsec$sec-collapse">
EOF;
        $output .= $content;
        if(isset($params['paste']))
          $output .= '<div style="margin:0px;margin-bottom:1em;width:100%;padding:0px;height:10px;background:#a3a3d3"><img src="http://static.pastebin.ca/imgs/corners/br-a3a3d3-dddddd.png" style="float:right" alt=""/><img src="http://static.pastebin.ca/imgs/corners/bl-a3a3d3-dddddd.png" style="float:left" alt=""/></div></div></div>';
        else
          $output .= '<div style="margin:0px;margin-bottom:1em;width:100%;padding:0px;height:10px;background:#ffffff"><img src="http://static.pastebin.ca/imgs/corners/br-ffffff-dddddd.png" style="float:right" alt=""/><img src="http://static.pastebin.ca/imgs/corners/bl-ffffff-dddddd.png" style="float:left" alt=""/></div></div></div>';
        
        $sec++;
        return $output;
    }
}
?>
