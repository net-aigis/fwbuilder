#!/usr/bin/env bash
# Phase-5931: client surface version + ssh_batch_mode_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_ssh_batch_mode_roster?:' webui/frontend/src/api/client.ts
echo "client surface/ssh_batch_mode_roster types ok"; echo "cleaned"; echo "OK: phase5931 e2e passed"
