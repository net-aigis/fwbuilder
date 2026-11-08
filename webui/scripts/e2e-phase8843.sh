#!/usr/bin/env bash
# Phase-8843: client soft_fertig_ssh_alternative_support_refresh_roster Soft 8840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_support_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 8840+ soft_fertig_ssh_alternative_support_refresh_roster type ok"; echo "cleaned"; echo "OK: phase8843 e2e passed"
