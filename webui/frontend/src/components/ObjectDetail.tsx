import { useEffect, useMemo, useState, type ReactNode } from "react";
import type { TreeNode } from "../api/client";

type Props = {
  object?: TreeNode | null;
  readOnly?: boolean;
  busy?: boolean;
  onSave?: (patch: {
    name: string;
    comment: string;
    attrs: Record<string, string | number>;
  }) => void;
  onOpenRules?: (which: "policy" | "nat" | "routing") => void;
  extras?: ReactNode;
};

const TYPE_FIELDS: Record<string, string[]> = {
  Network: ["address", "netmask"],
  NetworkIPv6: ["address", "netmask"],
  IPv4: ["address", "netmask"],
  IPv6: ["address", "netmask"],
  AddressRange: ["start_address", "end_address"],
  DNSName: ["dnsname", "run_time"],
  AddressTable: ["filename", "run_time"],
  TagService: ["tagcode"],
  UserService: ["userid"],
  CustomService: ["protocol", "address_family", "code"],
  TCPService: ["src_range_start", "src_range_end", "dst_range_start", "dst_range_end"],
  UDPService: ["src_range_start", "src_range_end", "dst_range_start", "dst_range_end"],
  TCPUDPService: ["src_range_start", "src_range_end", "dst_range_start", "dst_range_end"],
  ICMPService: ["type", "code"],
  ICMP6Service: ["type", "code"],
  IPService: ["protocol_num"],
  Firewall: ["platform", "host_OS", "version"],
  Host: ["platform", "host_OS"],
  Interface: ["phys_address", "label", "management"],
  Interval: [
    "from_hour",
    "from_minute",
    "to_hour",
    "to_minute",
    "days_of_week",
    "from_day",
    "from_month",
    "from_year",
    "to_day",
    "to_month",
    "to_year",
  ],
};

export function ObjectDetail({ object, readOnly, busy, onSave, onOpenRules, extras }: Props) {
  const [name, setName] = useState("");
  const [comment, setComment] = useState("");
  const [attrs, setAttrs] = useState<Record<string, string>>({});

  const fields = useMemo(() => {
    const typed = TYPE_FIELDS[object?.type ?? ""] ?? Object.keys(object?.attrs ?? {});
    return typed.includes("color") ? typed : [...typed, "color"];
  }, [object]);

  useEffect(() => {
    setName(object?.name ?? "");
    setComment(object?.comment ?? "");
    const next: Record<string, string> = {};
    for (const key of fields) {
      const v = object?.attrs?.[key];
      next[key] = v === undefined || v === null ? "" : String(v);
    }
    setAttrs(next);
  }, [object?.id, object?.name, object?.comment, object?.attrs, fields]);

  if (!object) {
    return (
      <div className="panel empty">
        <p>Select an object in the tree.</p>
      </div>
    );
  }

  const locked = Boolean(readOnly || object.ro || !onSave);
  const isFirewall = object.type === "Firewall" || object.type === "Cluster";

  function commit() {
    const out: Record<string, string | number> = {};
    for (const [k, v] of Object.entries(attrs)) {
      if (
        k === "type" ||
        k === "code" ||
        k === "protocol_num" ||
        k === "metric" ||
        k.startsWith("from_") ||
        k.startsWith("to_")
      ) {
        out[k] = v === "" ? 0 : Number(v);
      } else {
        out[k] = v;
      }
    }
    onSave?.({ name, comment, attrs: out });
  }

  return (
    <div className="panel">
      <header className="panel-header">
        <h2>{object.name || "(unnamed)"}</h2>
        <p className="muted">
          {object.type} · {object.id}
          {object.ro ? " · read-only" : ""}
        </p>
      </header>

      {isFirewall && onOpenRules ? (
        <div className="btn-row">
          <button type="button" className="ghost" disabled={busy} onClick={() => onOpenRules("policy")}>
            Policy
          </button>
          <button type="button" className="ghost" disabled={busy} onClick={() => onOpenRules("nat")}>
            NAT
          </button>
          <button type="button" className="ghost" disabled={busy} onClick={() => onOpenRules("routing")}>
            Routing
          </button>
        </div>
      ) : null}

      <label className="field block">
        Name
        <input value={name} disabled={locked || busy} onChange={(e) => setName(e.target.value)} />
      </label>
      <label className="field block">
        Comment
        <textarea
          value={comment}
          disabled={locked || busy}
          rows={3}
          onChange={(e) => setComment(e.target.value)}
        />
      </label>

      {fields.length ? (
        <div className="typed-grid">
          {fields.map((key) => (
            <label key={key} className="field block">
              {key}
              <input
                value={attrs[key] ?? ""}
                disabled={locked || busy}
                onChange={(e) => setAttrs((prev) => ({ ...prev, [key]: e.target.value }))}
              />
            </label>
          ))}
        </div>
      ) : (
        <p className="muted">No typed fields for this object type yet.</p>
      )}

      {!locked ? (
        <button type="button" disabled={busy} onClick={commit}>
          Apply object changes
        </button>
      ) : null}

      {extras}
    </div>
  );
}
