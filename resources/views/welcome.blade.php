<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>MyShop POS — Coming Soon</title>
    <style>
      :root{--bg:#0f172a;--card:#0b1220;--accent:#16a34a;--muted:#9ca3af;--glass:rgba(255,255,255,0.03)}
      *{box-sizing:border-box}
      html,body{height:100%;margin:0;font-family:Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;color:#e6eef6;background:linear-gradient(180deg,var(--bg) 0%, #071022 100%)}
      .wrap{min-height:100vh;display:flex;align-items:center;justify-content:center;padding:24px}
      .card{width:100%;max-width:920px;background:linear-gradient(180deg,var(--card), rgba(11,18,32,0.9));border-radius:16px;padding:48px;box-shadow:0 10px 30px rgba(2,6,23,0.6);border:1px solid rgba(255,255,255,0.03);display:flex;gap:24px;align-items:center}
      .brand{flex:0 0 220px;text-align:center}
      .logo{display:inline-block;background:var(--glass);padding:20px;border-radius:12px}
      .logo h1{margin:0;font-size:20px;letter-spacing:1px;color:var(--accent)}
      .title{flex:1}
      .title h2{margin:0;font-size:40px;color:#f8fafc}
      .title p.lead{margin:12px 0 0;color:var(--muted);font-size:18px}
      .meta{margin-top:18px;color:var(--muted);font-size:14px}
      .cta{margin-top:22px}
      .button{display:inline-block;background:var(--accent);color:#04201a;padding:10px 18px;border-radius:10px;font-weight:600;text-decoration:none}
      @media(max-width:700px){.card{flex-direction:column;text-align:center}.brand{flex:0 0 auto}}
    </style>
  </head>
  <body>
    <div class="wrap">
      <main class="card" role="main" aria-labelledby="coming-soon">
        <div class="brand">
          <div class="logo" aria-hidden="true">
            <h1>MyShop</h1>
          </div>
          <div style="margin-top:12px;color:var(--muted);font-size:13px">Point of Sale</div>
        </div>

        <div class="title">
          <h2 id="coming-soon">MyShop POS — Coming Soon</h2>
          <p class="lead">A simple, fast, and delightful point-of-sale system. We're polishing the last details and will be live soon.</p>

          <div class="meta">Want to be notified? Email us at <strong>hello@myshop.local</strong> or check back later.</div>

          <div class="cta">
            <a class="button" href="#">Notify me</a>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
