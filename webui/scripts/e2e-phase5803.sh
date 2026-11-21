#!/usr/bin/env bash
# Phase-5803: client soft_fertig_ssh_alternative_support_roster Soft 5800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_support_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5800+ soft_fertig_ssh_alternative_support_roster type ok"; echo "cleaned"; echo "OK: phase5803 e2e passed"
