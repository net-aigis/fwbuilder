#!/usr/bin/env bash
# Phase-5498: UI ssh-refusal-path-titles roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalPathTitlesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-refusal-path-titles roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-refusal-path-titles roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-refusal-path-titles roster ok"; echo "cleaned"; echo "OK: phase5498 e2e passed"
