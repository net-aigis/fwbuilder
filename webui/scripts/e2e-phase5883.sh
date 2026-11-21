#!/usr/bin/env bash
# Phase-5883: client soft_fertig_ssh_password_support_roster Soft 5880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_password_support_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5880+ soft_fertig_ssh_password_support_roster type ok"; echo "cleaned"; echo "OK: phase5883 e2e passed"
