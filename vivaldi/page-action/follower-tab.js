// https://forum.vivaldi.net/topic/31169/follower-tabs

function FollowerTab() {
  var linksArr = document.getElementsByTagName("a");
  for (i = 0; i < linksArr.length; i++) {
    linksArr[i].setAttribute("target", "followertab");
  }
}
if (document.readyState === 'complete') {
  FollowerTab();
} else {
  document.addEventListener('DOMContentLoaded', function () {
    FollowerTab();
  });
}