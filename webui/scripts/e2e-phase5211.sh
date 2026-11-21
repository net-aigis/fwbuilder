#!/usr/bin/env bash
# Phase-5211: client surface version + ssh_method_lists_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_ssh_method_lists_roster?:' webui/frontend/src/api/client.ts
echo "client surface/ssh_method_lists_roster types ok"; echo "cleaned"; echo "OK: phase5211 e2e passed"
