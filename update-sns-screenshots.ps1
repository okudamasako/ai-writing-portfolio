$path = 'c:\Users\User\Desktop\案件獲得\ポートフォリオDATA\★文章作成ポートフォリオ\WritingPortfolio\index.html'
$backup = 'c:\Users\User\Desktop\案件獲得\ポートフォリオDATA\★文章作成ポートフォリオ\WritingPortfolio\index-backup.html'

Copy-Item -LiteralPath $path -Destination $backup -Force

$content = Get-Content -Raw -LiteralPath $path -Encoding UTF8

$noteReplacement = @'
      <div class="screenshot-area reveal">
        <p class="screenshot-area-label">実際の投稿スクリーンショット / note</p>
        <div class="screenshot-slots cols-2" style="gap:1rem;">
          <div class="screenshot-slot">
            <img src="/images/note/note-screenshot-01.png" alt="note 投稿スクリーンショット 1" style="width:100%; border-radius:14px; object-fit:cover;" />
          </div>
          <div class="screenshot-slot">
            <img src="/images/note/note-screenshot-02.png" alt="note 投稿スクリーンショット 2" style="width:100%; border-radius:14px; object-fit:cover;" />
          </div>
        </div>
        <p class="screenshot-area-hint">※ 縦長スクリーンショットをそのまま &lt;img&gt; に差し替え、アカウント名も更新してください。</p>
      </div>
'@

$content = [Regex]::Replace(
    $content,
    '(?s)<div class="screenshot-area reveal">\s*<p class="screenshot-area-label">実際の投稿スクリーンショット / note</p>.*?<p class="screenshot-area-hint">.*?</p>\s*</div>',
    $noteReplacement,
    [System.Text.RegularExpressions.RegexOptions]::Singleline
)

$threadsReplacement = @'
      <div class="screenshot-area reveal" style="background:var(--white); border-color:var(--stone);">
        <p class="screenshot-area-label">実際の投稿スクリーンショット / Threads</p>
        <div class="screenshot-slots" style="display:grid; grid-template-columns:repeat(3,1fr); gap:1rem; margin-top:1rem;">
          <div class="screenshot-slot">
            <img src="/images/threads/threads-screenshot-01.png" alt="Threads 投稿スクリーンショット 1" style="width:100%; border-radius:14px; object-fit:cover;" />
          </div>
          <div class="screenshot-slot">
            <img src="/images/threads/threads-screenshot-02.png" alt="Threads 投稿スクリーンショット 2" style="width:100%; border-radius:14px; object-fit:cover;" />
          </div>
          <div class="screenshot-slot">
            <img src="/images/threads/threads-screenshot-03.png" alt="Threads 投稿スクリーンショット 3" style="width:100%; border-radius:14px; object-fit:cover;" />
          </div>
        </div>
        <p class="screenshot-area-hint">実際の投稿スクリーンショットで、Threads運用を伝えます。</p>
      </div>
'@

$content = [Regex]::Replace(
    $content,
    '(?s)<div class="screenshot-area reveal" style="background:var\(--white\); border-color:var\(--stone\);">.*?<p class="screenshot-area-hint">.*?</p>\s*</div>',
    $threadsReplacement,
    [System.Text.RegularExpressions.RegexOptions]::Singleline
)

$instagramReplacement = @'
      <div class="screenshot-area reveal" style="margin-top:2rem; background:var(--ivory);">
        <p class="screenshot-area-label">実際の投稿スクリーンショット / Instagram</p>
        <div class="screenshot-slots" style="display:grid; grid-template-columns:1fr 1fr; gap:1rem; margin-top:1rem;">
          <div class="screenshot-slot">
            <img src="/images/instagram/instagram-screenshot-01.png" alt="Instagram 投稿スクリーンショット 1" style="width:100%; border-radius:14px; object-fit:cover;" />
          </div>
          <div class="screenshot-slot">
            <img src="/images/instagram/instagram-screenshot-02.png" alt="Instagram 投稿スクリーンショット 2" style="width:100%; border-radius:14px; object-fit:cover;" />
          </div>
        </div>
        <p class="screenshot-area-hint">実際のInstagram画面キャプチャで、運用イメージを伝えます。</p>
      </div>
'@

$content = [Regex]::Replace(
    $content,
    '(?s)<div class="screenshot-area reveal" style="margin-top:2rem; background:var\(--ivory\);">.*?<p class="screenshot-area-hint">.*?</p>\s*</div>',
    $instagramReplacement,
    [System.Text.RegularExpressions.RegexOptions]::Singleline
)

$youtubeReplacement = @'
      <div class="yt-night-photo-wrap reveal">
        <div style="display:grid; grid-template-columns:1fr 1fr; gap:1rem;">
          <div style="border-radius:20px; overflow:hidden;">
            <img src="/images/youtube/youtube-screenshot-01.png" alt="YouTube チャンネルスクリーンショット" style="width:100%; height:100%; object-fit:cover;" />
          </div>
          <div style="border-radius:20px; overflow:hidden;">
            <img src="/images/youtube/youtube-screenshot-02.png" alt="YouTube サムネイルスクリーンショット" style="width:100%; height:100%; object-fit:cover;" />
          </div>
        </div>
        <div class="yt-night-photo-caption">
          <p>YouTube運用の実際のスクリーンショット。動画一覧とサムネイル設計を示します。</p>
        </div>
      </div>
'@

$content = [Regex]::Replace(
    $content,
    '(?s)<div class="yt-night-photo-wrap reveal">.*?</div>\s*<!-- コンセプトボックス -->',
    $youtubeReplacement + "`r`n`r`n      <!-- コンセプトボックス -->",
    [System.Text.RegularExpressions.RegexOptions]::Singleline
)

Set-Content -LiteralPath $path -Value $content -Encoding UTF8