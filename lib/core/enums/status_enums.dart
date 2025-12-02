enum Status{
  ACTIVE,
  PENDING,
  REJECTED,
  SUSBENDED
}
Map<num,Status> statusMap={
  0:Status.PENDING,
  1:Status.ACTIVE,
  2:Status.SUSBENDED,
  3:Status.REJECTED
};
Status getStatus(num status)=>statusMap[status]!;