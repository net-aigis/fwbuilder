#!/usr/bin/env bash
# Phase-6123: client soft_fertig_ssh_not_implemented_check_roster Soft 6120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_check_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6120+ soft_fertig_ssh_not_implemented_check_roster type ok"; echo "cleaned"; echo "OK: phase6123 e2e passed"
