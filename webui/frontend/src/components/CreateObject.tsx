import { useEffect, useState } from "react";
import { createObject, fetchPlatforms } from "../api/client";

type Props = {
  sessionId: string;
  parentId: string;
  parentName?: string;
  parentType?: string;
  busy?: boolean;
  onCreated: (id: string) => void;
  onBusy?: (busy: boolean) => void;
  onError?: (msg: string | null) => void;
  onStatus?: (msg: string) => void;
};

const BASE_TYPES = [
  "Network",
  "NetworkIPv6",
  "Host",
  "IPv4",
  "IPv6",
  "AddressRange",
  "DNSName",
  "AddressTable",
  "TCPService",
  "UDPService",
  "ICMPService",
  "ICMP6Service",
  "IPService",
  "TagService",
  "UserService",
  "CustomService",
  "Interval",
  "IntervalGroup",
  "ObjectGroup",
  "ServiceGroup",
];

export function CreateObject({
  sessionId,
  parentId,
  parentName,
  parentType,
  busy,
  onCreated,
  onBusy,
  onError,
  onStatus,
}: Props) {
  const hostLike = parentType === "Firewall" || parentType === "Host" || parentType === "Cluster";
  const ifaceLike = parentType === "Interface";
  const groupLike = parentType === "ObjectGroup" || parentType === "Library";
  const rootLike = parentType === "FWObjectDatabase";
  const TYPES = ifaceLike
    ? ["IPv4", "IPv6", "AttachedNetworks", ...BASE_TYPES]
    : hostLike
      ? ["Interface", "IPv4", "IPv6", "Policy", "NAT", "Routing", ...BASE_TYPES]
      : rootLike
        ? ["Library"]
        : groupLike
          ? ["Firewall", "Host", "Cluster", ...BASE_TYPES]
          : BASE_TYPES;
  const [type, setType] = useState(
    rootLike ? "Library" : hostLike ? "Interface" : groupLike ? "Firewall" : "Network",
  );
  const [name, setName] = useState("");
  const [address, setAddress] = useState("");
  const [netmask, setNetmask] = useState("255.255.255.0");
  const [endAddress, setEndAddress] = useState("");
  const [dstPort, setDstPort] = useState("");
  const [srcPort, setSrcPort] = useState("");
  const [dnsName, setDnsName] = useState("");
  const [runTime, setRunTime] = useState(true);
  const [filename, setFilename] = useState("");
  const [tagCode, setTagCode] = useState("");
  const [userId, setUserId] = useState("");
  const [fromHour, setFromHour] = useState("9");
  const [fromMinute, setFromMinute] = useState("0");
  const [toHour, setToHour] = useState("17");
  const [toMinute, setToMinute] = useState("0");
  const [daysOfWeek, setDaysOfWeek] = useState("1,2,3,4,5");
  const [protocolNum, setProtocolNum] = useState("47");
  const [customProto, setCustomProto] = useState("tcp");
  const [customFamily, setCustomFamily] = useState("inet");
  const [customCode, setCustomCode] = useState("");
  const [icmpType, setIcmpType] = useState("8");
  const [icmpCode, setIcmpCode] = useState("0");
  const [color, setColor] = useState("");
  const [platform, setPlatform] = useState("nftables");
  const [hostOs, setHostOs] = useState("linux24");
  const [platforms, setPlatforms] = useState<string[]>([]);
  const [oses, setOses] = useState<string[]>([]);

  const isService = type === "TCPService" || type === "UDPService" || type === "TCPUDPService";
  const isRange = type === "AddressRange";
  const isDns = type === "DNSName";
  const isAddrTable = type === "AddressTable";
  const isTag = type === "TagService";
  const isUser = type === "UserService";
  const isInterval = type === "Interval";
  const isIpService = type === "IPService";
  const isCustom = type === "CustomService";
  const isIcmp = type === "ICMPService" || type === "ICMP6Service";
  const needsNetmask = type === "Network" || type === "IPv4" || type === "NetworkIPv6" || type === "IPv6";
  const isFwLike = type === "Firewall" || type === "Host" || type === "Cluster";
  const showAddress =
    !isDns &&
    !isAddrTable &&
    !isTag &&
    !isUser &&
    !isInterval &&
    !isIpService &&
    !isCustom &&
    !isIcmp &&
    (isRange || needsNetmask || type === "Host");

  useEffect(() => {
    if (!isFwLike) return;
    let cancelled = false;
    void fetchPlatforms()
      .then((res) => {
        if (cancelled) return;
        const plats = (res.platforms || [])
          .filter((p) => p.status !== "disabled")
          .map((p) => p.name)
          .filter(Boolean);
        const osList = (res.oses || []).map((o) => o.name).filter(Boolean);
        setPlatforms(plats);
        setOses(osList);
        if (plats.length && !plats.includes(platform)) setPlatform(plats[0]);
        if (osList.length && !osList.includes(hostOs)) setHostOs(osList[0]);
      })
      .catch(() => {
        /* keep manual defaults */
      });
    return () => {
      cancelled = true;
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isFwLike]);

  async function submit() {
    if (!name.trim()) {
      onError?.("name required");
      return;
    }
    onBusy?.(true);
    onError?.(null);
    try {
      const attrs: Record<string, string | number> = {};
      if (isRange) {
        if (address.trim()) attrs.start_address = address.trim();
        if (endAddress.trim()) attrs.end_address = endAddress.trim();
      } else if (isDns) {
        if (dnsName.trim()) attrs.dnsname = dnsName.trim();
        attrs.run_time = runTime ? "True" : "False";
      } else if (isAddrTable) {
        if (filename.trim()) attrs.filename = filename.trim();
        attrs.run_time = runTime ? "True" : "False";
      } else if (isTag) {
        if (tagCode.trim()) attrs.tagcode = tagCode.trim();
      } else if (isUser) {
        if (userId.trim()) attrs.userid = userId.trim();
      } else if (isInterval) {
        attrs.from_hour = Number(fromHour) || 0;
        attrs.from_minute = Number(fromMinute) || 0;
        attrs.to_hour = Number(toHour) || 0;
        attrs.to_minute = Number(toMinute) || 0;
        if (daysOfWeek.trim()) attrs.days_of_week = daysOfWeek.trim();
      } else if (isIpService) {
        if (protocolNum.trim()) attrs.protocol_num = Number(protocolNum) || 0;
      } else if (isCustom) {
        if (customProto.trim()) attrs.protocol = customProto.trim();
        if (customFamily.trim()) attrs.address_family = customFamily.trim();
        if (customCode.trim()) attrs.code = customCode.trim();
      } else if (isIcmp) {
        if (icmpType.trim()) attrs.type = Number(icmpType) || 0;
        if (icmpCode.trim()) attrs.code = Number(icmpCode) || 0;
      } else {
        if (address.trim()) attrs.address = address.trim();
        if (netmask.trim() && needsNetmask) attrs.netmask = netmask.trim();
      }
      if (isService) {
        if (dstPort.trim()) {
          attrs.dst_range_start = dstPort.trim();
          attrs.dst_range_end = dstPort.trim();
        }
        if (srcPort.trim()) {
          attrs.src_range_start = srcPort.trim();
          attrs.src_range_end = srcPort.trim();
        }
      }
      if (isFwLike) {
        if (platform.trim()) attrs.platform = platform.trim();
        if (hostOs.trim()) attrs.host_OS = hostOs.trim();
      }
      if (color.trim() && type !== "Library") attrs.color = color.trim();
      const obj = await createObject(sessionId, {
        parent_id: parentId,
        type,
        name: name.trim(),
        attrs: Object.keys(attrs).length ? attrs : undefined,
      });
      onStatus?.(`Created ${obj.type} ${obj.name}`);
      setName("");
      setAddress("");
      setEndAddress("");
      setDstPort("");
      setSrcPort("");
      setDnsName("");
      setFilename("");
      onCreated(obj.id);
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  return (
    <div className="create-object">
      <header className="panel-header">
        <h3>Create under {parentName || parentId}</h3>
      </header>
      <div className="typed-grid">
        <label className="field block">
          Type
          <select value={type} disabled={busy} onChange={(e) => setType(e.target.value)}>
            {TYPES.map((t) => (
              <option key={t} value={t}>
                {t}
              </option>
            ))}
          </select>
        </label>
        <label className="field block">
          Name
          <input value={name} disabled={busy} onChange={(e) => setName(e.target.value)} />
        </label>
        {isDns ? (
          <label className="field block">
            DNS name
            <input value={dnsName} disabled={busy} onChange={(e) => setDnsName(e.target.value)} />
          </label>
        ) : null}
        {isAddrTable ? (
          <label className="field block">
            Filename
            <input value={filename} disabled={busy} onChange={(e) => setFilename(e.target.value)} />
          </label>
        ) : null}
        {isDns || isAddrTable ? (
          <label className="field block inline">
            <input
              type="checkbox"
              checked={runTime}
              disabled={busy}
              onChange={(e) => setRunTime(e.target.checked)}
            />{" "}
            Resolve at run time
          </label>
        ) : null}
        {showAddress ? (
          <label className="field block">
            {isRange ? "Start address" : "Address"}
            <input value={address} disabled={busy} onChange={(e) => setAddress(e.target.value)} />
          </label>
        ) : null}
        {isRange ? (
          <label className="field block">
            End address
            <input value={endAddress} disabled={busy} onChange={(e) => setEndAddress(e.target.value)} />
          </label>
        ) : null}
        {needsNetmask ? (
          <label className="field block">
            Netmask
            <input value={netmask} disabled={busy} onChange={(e) => setNetmask(e.target.value)} />
          </label>
        ) : null}
        {isService ? (
          <>
            <label className="field block">
              Source port
              <input value={srcPort} disabled={busy} onChange={(e) => setSrcPort(e.target.value)} />
            </label>
            <label className="field block">
              Destination port
              <input value={dstPort} disabled={busy} onChange={(e) => setDstPort(e.target.value)} />
            </label>
          </>
        ) : null}
        {isTag ? (
          <label className="field block">
            Tag code
            <input value={tagCode} disabled={busy} onChange={(e) => setTagCode(e.target.value)} />
          </label>
        ) : null}
        {isUser ? (
          <label className="field block">
            User id
            <input value={userId} disabled={busy} onChange={(e) => setUserId(e.target.value)} />
          </label>
        ) : null}
        {isInterval ? (
          <>
            <label className="field block">
              From (hour:min)
              <div className="inline-pair">
                <input value={fromHour} disabled={busy} onChange={(e) => setFromHour(e.target.value)} />
                <input value={fromMinute} disabled={busy} onChange={(e) => setFromMinute(e.target.value)} />
              </div>
            </label>
            <label className="field block">
              To (hour:min)
              <div className="inline-pair">
                <input value={toHour} disabled={busy} onChange={(e) => setToHour(e.target.value)} />
                <input value={toMinute} disabled={busy} onChange={(e) => setToMinute(e.target.value)} />
              </div>
            </label>
            <label className="field block">
              Days of week
              <input
                value={daysOfWeek}
                disabled={busy}
                onChange={(e) => setDaysOfWeek(e.target.value)}
                placeholder="0=Sun … 6=Sat"
              />
            </label>
          </>
        ) : null}
        {isIpService ? (
          <label className="field block">
            Protocol number
            <input value={protocolNum} disabled={busy} onChange={(e) => setProtocolNum(e.target.value)} />
          </label>
        ) : null}
        {isCustom ? (
          <>
            <label className="field block">
              Protocol
              <input value={customProto} disabled={busy} onChange={(e) => setCustomProto(e.target.value)} />
            </label>
            <label className="field block">
              Address family
              <select value={customFamily} disabled={busy} onChange={(e) => setCustomFamily(e.target.value)}>
                <option value="inet">inet</option>
                <option value="inet6">inet6</option>
              </select>
            </label>
            <label className="field block">
              Code
              <input value={customCode} disabled={busy} onChange={(e) => setCustomCode(e.target.value)} />
            </label>
          </>
        ) : null}
        {isIcmp ? (
          <>
            <label className="field block">
              ICMP type
              <input value={icmpType} disabled={busy} onChange={(e) => setIcmpType(e.target.value)} />
            </label>
            <label className="field block">
              ICMP code
              <input value={icmpCode} disabled={busy} onChange={(e) => setIcmpCode(e.target.value)} />
            </label>
          </>
        ) : null}
        {isFwLike ? (
          <>
            <label className="field block">
              Platform
              {platforms.length ? (
                <select value={platform} disabled={busy} onChange={(e) => setPlatform(e.target.value)}>
                  {platforms.map((p) => (
                    <option key={p} value={p}>
                      {p}
                    </option>
                  ))}
                </select>
              ) : (
                <input value={platform} disabled={busy} onChange={(e) => setPlatform(e.target.value)} />
              )}
            </label>
            <label className="field block">
              Host OS
              {oses.length ? (
                <select value={hostOs} disabled={busy} onChange={(e) => setHostOs(e.target.value)}>
                  {oses.map((o) => (
                    <option key={o} value={o}>
                      {o}
                    </option>
                  ))}
                </select>
              ) : (
                <input value={hostOs} disabled={busy} onChange={(e) => setHostOs(e.target.value)} />
              )}
            </label>
          </>
        ) : null}
        {type !== "Library" ? (
          <label className="field block">
            Color
            <input
              type="color"
              value={color || "#cccccc"}
              disabled={busy}
              onChange={(e) => setColor(e.target.value)}
              title="Optional object color"
            />
          </label>
        ) : null}
      </div>
      <button type="button" disabled={busy} onClick={() => void submit()}>
        Create
      </button>
    </div>
  );
}
