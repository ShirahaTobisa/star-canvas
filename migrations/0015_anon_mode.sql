-- 0015: 匿名模式（访客免费档生图）计数桶
-- bucket 形如 m:<ip哈希>:<分钟> / d:<ip哈希>:<日期> / g:<日期>；只存 IP 的加盐哈希，不存原始 IP。
-- 匿名模式配置存在 runtime_kv（k='anon_config'），默认关闭，需站长在设置里开启。
CREATE TABLE IF NOT EXISTS anon_usage (
  bucket TEXT PRIMARY KEY,
  count INTEGER NOT NULL DEFAULT 0,
  expires_at TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS anon_usage_expires_idx ON anon_usage(expires_at);
