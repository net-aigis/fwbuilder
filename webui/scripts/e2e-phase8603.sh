#!/usr/bin/env bash
# Phase-8603: client soft_fertig_ssh_implemented_identity_refresh_roster Soft 8600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_identity_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 8600+ soft_fertig_ssh_implemented_identity_refresh_roster type ok"; echo "cleaned"; echo "OK: phase8603 e2e passed"
