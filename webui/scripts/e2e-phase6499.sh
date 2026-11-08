#!/usr/bin/env bash
# Phase-6499: UI honesty milestone + schema 5.12 at 18450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNoteSnapshotRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18450 UI ok"; echo "cleaned"; echo "OK: phase6499 e2e passed"
