<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Roblox Anti-AFK Script — README</title>
  <style>
    :root{
      --bg:#0f1724;
      --card:#0b1220;
      --muted:#94a3b8;
      --accent:#7c3aed;
      --accent-2:#06b6d4;
      --glass: rgba(255,255,255,0.03);
      --radius:14px;
      --mono: ui-monospace, SFMono-Regular, Menlo, Monaco, "Roboto Mono", "Courier New", monospace;
      color-scheme: dark;
    }

    *{box-sizing:border-box}
    html,body{height:100%}
    body{
      margin:0;
      background: linear-gradient(180deg,var(--bg),#071022 120%);
      font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
      color:#e6eef8;
      -webkit-font-smoothing:antialiased;
      -moz-osx-font-smoothing:grayscale;
      padding:32px;
      display:flex;
      align-items:center;
      justify-content:center;
    }

    .wrap{
      width:100%;
      max-width:1000px;
      background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
      border-radius:18px;
      padding:28px;
      box-shadow: 0 10px 40px rgba(2,6,23,0.8);
      border: 1px solid rgba(255,255,255,0.03);
      backdrop-filter: blur(6px);
    }

    header{
      display:flex;
      gap:18px;
      align-items:center;
      margin-bottom:18px;
    }

    .logo{
      width:72px;
      height:72px;
      border-radius:12px;
      background: linear-gradient(135deg,var(--accent),var(--accent-2));
      display:flex;
      align-items:center;
      justify-content:center;
      font-weight:700;
      font-family:var(--mono);
      font-size:20px;
      color:rgba(255,255,255,0.95);
      box-shadow: 0 6px 18px rgba(124,58,237,0.18), inset 0 -6px 18px rgba(255,255,255,0.03);
    }

    h1{
      margin:0;
      font-size:20px;
      letter-spacing:-0.2px;
    }
    p.lead{ margin:6px 0 0 0; color:var(--muted); font-size:14px; }

    .badges{ margin-left:auto; display:flex; gap:8px; align-items:center; }
    .badge{ background:var(--glass); padding:6px 10px; border-radius:999px; color:var(--muted); font-size:13px; border:1px solid rgba(255,255,255,0.02); }

    .grid{
      display:grid;
      grid-template-columns: 1fr 360px;
      gap:18px;
      margin-top:18px;
    }

    .card{
      background: linear-gradient(180deg, rgba(255,255,255,0.01), rgba(255,255,255,0.00));
      padding:18px;
      border-radius:12px;
      border:1px solid rgba(255,255,255,0.02);
    }

    .card h2{ margin:0 0 8px 0; font-size:16px }
    .muted { color:var(--muted); font-size:14px; line-height:1.5 }

    ul.features{ padding-left:18px; margin:8px 0 0 0; color:var(--muted) }
    ul.features li{ margin:8px 0; }

    .pill { display:inline-block; background: rgba(255,255,255,0.03); padding:6px 10px; border-radius:8px; font-size:13px; color:var(--muted); border:1px solid rgba(255,255,255,0.02); }

    .codewrap{
      margin-top:12px;
      background: linear-gradient(180deg, #071026, #04101a);
      border-radius:12px;
      padding:12px;
      border:1px solid rgba(255,255,255,0.03);
      overflow:auto;
    }

    pre{
      margin:0;
      font-family: var(--mono);
      font-size:13px;
      line-height:1.35;
      color:#dbeafe;
      white-space:pre;
    }

    .meta{ display:flex; gap:8px; flex-wrap:wrap; margin-top:12px }
    .meta .item{ background:rgba(255,255,255,0.02); padding:8px 10px; border-radius:10px; color:var(--muted); font-size:13px; border:1px solid rgba(255,255,255,0.02) }

    .btn{
      display:inline-block;
      text-decoration:none;
      padding:10px 14px;
      border-radius:10px;
      background:linear-gradient(90deg,var(--accent),var(--accent-2));
      color:white;
      font-weight:600;
      box-shadow: 0 8px 30px rgba(7,10,35,0.6);
      border: none;
    }

    footer{ margin-top:16px; display:flex; gap:8px; align-items:center; justify-content:space-between; }
    footer .left{ color:var(--muted); font-size:13px }
    footer .right{ color:var(--muted); font-size:13px }

    /* small screens */
    @media (max-width:880px){
      .grid{ grid-template-columns: 1fr; }
      .badges{ display:none; }
    }

    /* small code highlighting accents */
    .hl-key{ color:#ffd580; }
    .hl-fn{ color:#9be7ff; }
    .hl-comment{ color:#8b9aa8; font-style:italic }
  </style>
</head>
<body>
  <div class="wrap" role="main">
    <header>
      <div class="logo">AHK</div>
      <div>
        <h1>Roblox Anti-AFK Script <span style="font-weight:500;color:var(--muted);">(AutoHotkey)</span></h1>
        <p class="lead">Lightweight AutoHotkey script that prevents the 20-minute AFK kick — quietly restores your active window so you can keep using your PC.</p>
      </div>

      <div class="badges" aria-hidden="true">
        <div class="badge">PC / Windows</div>
        <div class="badge">AutoHotkey</div>
        <div class="badge">Open Source</div>
      </div>
    </header>

    <div class="grid" aria-live="polite">
      <section class="card" aria-label="Overview">
        <h2>Overview</h2>
        <p class="muted">This small AutoHotkey loop temporarily activates the Roblox window, sends a keypress (default: <span class="pill">9</span>), minimizes Roblox, and returns focus to whatever you were doing before. The action happens fast — like a blink — so it doesn't interfere with normal PC use.</p>

        <div style="margin-top:12px">
          <h2>Features</h2>
          <ul class="features">
            <li><strong>Non-intrusive:</strong> returns focus to your last active window automatically.</li>
            <li><strong>Configurable:</strong> change key and timing to suit different Roblox games.</li>
            <li><strong>Low resource use:</strong> simple loop, sleeps most of the time.</li>
            <li><strong>Easy to use:</strong> drop the `.ahk` file and run it with AutoHotkey installed.</li>
          </ul>
        </div>

        <div class="meta" aria-hidden="false">
          <div class="item">Recommended Sleep: <strong>1140000 ms</strong> (19 minutes)</div>
          <div class="item">Key Sent: <strong>9</strong></div>
          <div class="item">Platform: <strong>Windows</strong></div>
        </div>

        <div style="margin-top:14px">
          <a class="btn" href="#code">View Script</a>
          <span style="margin-left:12px;color:var(--muted);font-size:14px">or use it via GitHub Pages / repo</span>
        </div>

        <div style="margin-top:14px" class="muted">
          <strong>Note:</strong> This script only automates a harmless keypress. Make sure to follow Roblox community rules and the terms of the game you are in before using any automation tools.
        </div>
      </section>

      <aside class="card" aria-label="Quick install">
        <h2>Quick install</h2>
        <ol style="color:var(--muted); padding-left:18px; margin-top:8px;">
          <li>Install AutoHotkey from <span style="color:var(--accent)">autohotkey.com</span>.</li>
          <li>Create a file named <code>Roblox_AntiAFK.ahk</code>.</li>
          <li>Paste the script (below) and save.</li>
          <li>Run the script by double-clicking it.</li>
        </ol>

        <div style="margin-top:12px">
          <h3 style="margin:0 0 8px 0">Customization</h3>
          <p class="muted" style="margin:0">Change the key or sleep timing inside the script. For example, replace <code>send,{9}</code> with <code>send,{space}</code> to send spacebar.</p>
        </div>

        <div style="margin-top:14px">
          <h3 style="margin:0 0 8px 0">Use as GitHub Page</h3>
          <p class="muted" style="margin:0">Rename file to <code>index.html</code> and enable GitHub Pages in the repo settings to show this as a project page.</p>
        </div>
      </aside>
    </div>

    <section id="code" class="card" style="margin-top:18px;">
      <h2>Script (AutoHotkey)</h2>
      <p class="muted">Copy the snippet below into <code>Roblox_AntiAFK.ahk</code> and run it.</p>

      <div class="codewrap" role="region" aria-label="AutoHotkey code">
<pre><code>// Roblox Anti-AFK (AutoHotkey)
loop
{
    ; store the currently active window id so we can restore focus
    WinGet, winid,, A

    ; activate Roblox window (matches title "Roblox")
    WinActivate, Roblox

    ; send the configured key (default: 9)
    send,{9}

    ; short pause to ensure the game receives the key
    Sleep, 100

    ; minimize the currently active window (Roblox)
    WinMinimize, A

    ; restore the previously active window
    WinActivate ahk_id %winid%

    ; sleep ~19 minutes (1140000 ms) before repeating
    Sleep, 1140000
}
</code></pre>
      </div>

      <div style="margin-top:12px" class="muted">
        <strong>Tips</strong>
        <ul style="padding-left:18px; margin:8px 0;">
          <li>To change frequency, modify the <code>Sleep, 1140000</code> value (milliseconds).</li>
          <li>If your Roblox window title isn't exactly "Roblox", change <code>WinActivate, Roblox</code> to a more specific title or use <code>SetTitleMatchMode, 2</code> for partial matches.</li>
          <li>Test the script in a safe environment first (private server or solo game).</li>
        </ul>
      </div>
    </section>

    <footer>
      <div class="left">License: <strong>MIT</strong> (recommended)</div>
      <div class="right">Made with <span style="color:var(--accent)">AutoHotkey</span> • Edit &amp; contribute on GitHub</div>
    </footer>
  </div>
</body>
</html>
