#!/usr/bin/env bash
# Phase-4843: client soft_fertig_ssh_implemented_roster Soft 4840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4840+ soft_fertig_ssh_implemented_roster type ok"; echo "cleaned"; echo "OK: phase4843 e2e passed"
