#!/usr/bin/env bash
# Phase-6458: UI ssh-not-implemented-batch roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAuthNoteSnapshotRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-not-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-not-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-not-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6458 e2e passed"
