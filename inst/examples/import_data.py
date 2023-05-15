def executeSQL(sql_path, conn):
  sql_full_path = os.path.abspath(sql_path)
  # read and clean SQL file (credits to @seantk)
  with open(sql_full_path, 'r') as fl:
    query = fl.read()
  query = re.sub(pattern=r'(--.*)|(((/\*)+?[\w\W]+?(\*/)+))',repl='', string=query)
  #See the original post for the code below: https://stackoverflow.com/a/60893659
  with conn.cursor() as conn_cursor:
    conn_cursor.execute(query)
  df = conn_cursor.fetchall()
  col_names = [row[0] for row in conn_cursor.description]
  
  output = pd.DataFrame(df, columns=col_names)
  return output