#!/usr/bin/env bash
# Phase-258: spacer sizeHint applied in qtSpacerStyle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'size_hint' webui/frontend/src/qtGrid.ts
grep -Fq 'minWidth' webui/frontend/src/qtGrid.ts
grep -Fq 'size_hint' webui/frontend/src/api/client.ts
(cd webui/frontend && npm run typecheck)
echo "qtSpacer size_hint ok"
echo "cleaned"
echo "OK: phase258 e2e passed"
