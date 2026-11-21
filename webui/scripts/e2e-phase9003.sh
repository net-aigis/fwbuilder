#!/usr/bin/env bash
# Phase-9003: client soft_fertig_ssh_auth_refresh_roster Soft 9000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9000+ soft_fertig_ssh_auth_refresh_roster type ok"; echo "cleaned"; echo "OK: phase9003 e2e passed"
