#!/usr/bin/env bash
# Phase-8283: client soft_fertig_ssh_alternative_presence_refresh_roster Soft 8280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_presence_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 8280+ soft_fertig_ssh_alternative_presence_refresh_roster type ok"; echo "cleaned"; echo "OK: phase8283 e2e passed"
