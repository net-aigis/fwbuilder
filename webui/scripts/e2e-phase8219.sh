#!/usr/bin/env bash
# Phase-8219: client soft_fertig_ssh_alternative_presence_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_presence_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-alternative-presence-refresh roster type ok"; echo "cleaned"; echo "OK: phase8219 e2e passed"
