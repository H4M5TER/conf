// https://forum.vivaldi.net/topic/59763/opml-export

vivaldi.prefs.get("vivaldi.rss.settings", feeds => {
  function html(str) { return str.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;').replace(/>/g, '&gt;'); }
  let opml = feeds.reduce((acc, feed) => {
    return acc + `\n<outline type="rss" text="${html(feed.title)}" title="${html(feed.title)}" xmlUrl="${html(feed.url)}"/>`;
  }, `<?xml version="1.0" encoding="utf-8"?><opml version="1.0"><head><title>Feeds exported from Vivaldi</title></head><body>`);
  opml += `\n</body></opml>`;
  const filename = "exportedfeeds_" + new Date().toDateString().replace(/\s/g, "-") + ".opml";
  const textfile = new File([opml], filename, { type: "text/xml" });
  const dl = document.createElement("a");
  dl.download = filename;
  dl.setAttribute("href", window.URL.createObjectURL(textfile));
  dl.click();
});