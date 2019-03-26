# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

# BONUS PROBLEM: requires sub-queries or joins. Attempt this after completing
# sections 04 and 07.

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT
      DISTINCT phys_years.yr
    FROM
    (SELECT
      *
    FROM
      nobels
    WHERE 
      subject = 'Chemistry') AS chem_years
    RIGHT JOIN
      (SELECT
        yr
      FROM
        nobels
      WHERE
        subject = 'Physics') AS phys_years
    ON chem_years.yr = phys_years.yr
    WHERE chem_years.yr IS NULL
  SQL
end
