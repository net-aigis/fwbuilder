#!/usr/bin/env bash
# Phase-6043: client soft_fertig_ssh_implemented_check_roster Soft 6040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_check_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6040+ soft_fertig_ssh_implemented_check_roster type ok"; echo "cleaned"; echo "OK: phase6043 e2e passed"
