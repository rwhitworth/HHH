while (<>)
{
  if (/[0-9a-f]{4,10}/) { print $_; }
}
