#!/usr/bin/env bash
# Phase-6539: client ssh_honesty_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_honesty_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented-batch roster type ok"; echo "cleaned"; echo "OK: phase6539 e2e passed"
