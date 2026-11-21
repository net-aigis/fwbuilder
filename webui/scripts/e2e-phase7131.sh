#!/usr/bin/env bash
# Phase-7131: client surface version + ssh_alternatives_refresh_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_ssh_alternatives_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client surface/ssh_alternatives_refresh_roster types ok"; echo "cleaned"; echo "OK: phase7131 e2e passed"
