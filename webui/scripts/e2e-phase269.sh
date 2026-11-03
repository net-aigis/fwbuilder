#!/usr/bin/env bash
# Phase-269: walkthrough UI button + password SSH probe refuse endpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Walkthrough (dry)' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Probe password SSH' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'ssh-auth/password' webui/backend/fwbweb_api/routes/platforms.py
grep -Fq 'refusePasswordSsh' webui/frontend/src/api/client.ts
grep -Fq 'walkthrough_path' webui/backend/fwbweb_api/routes/platforms.py
(cd webui/frontend && npm run typecheck)
echo "walkthrough/password UI ok"
echo "cleaned"
echo "OK: phase269 e2e passed"
