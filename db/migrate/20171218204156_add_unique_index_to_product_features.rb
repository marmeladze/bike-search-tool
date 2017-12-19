class AddUniqueIndexToProductFeatures < ActiveRecord::Migration
	def up
	  execute <<-SQL
	    CREATE FUNCTION sort_array(unsorted_array anyarray) RETURNS anyarray AS $$
	      BEGIN
	        RETURN (SELECT ARRAY_AGG(val) AS sorted_array
	        FROM
    			(SELECT
    			  UNNEST(string_to_array(lower(array_to_string(unsorted_array, ',')), ','))
    			  AS val ORDER BY val)
    			AS sorted_vals);
	      END;
	    $$ LANGUAGE plpgsql IMMUTABLE STRICT;

	    CREATE UNIQUE INDEX index_products_on_name_and_manufacturer_url_and_features ON products USING btree (manufacturer_url, name, sort_array(features));
	  SQL
	end

	def down
	  execute <<-SQL
	    DROP INDEX IF EXISTS index_products_on_name_and_manufacturer_url_and_features;
	    DROP FUNCTION IF EXISTS sort_array(unsorted_array anyarray);
	  SQL
	end
end
