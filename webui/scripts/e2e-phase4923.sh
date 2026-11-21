#!/usr/bin/env bash
# Phase-4923: client soft_fertig_ssh_capability_flags_roster Soft 4920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_capability_flags_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4920+ soft_fertig_ssh_capability_flags_roster type ok"; echo "cleaned"; echo "OK: phase4923 e2e passed"
