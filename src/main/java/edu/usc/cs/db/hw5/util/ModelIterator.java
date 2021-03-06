package edu.usc.cs.db.hw5.util;

import edu.usc.cs.db.hw5.model.GeoModel;
import edu.usc.cs.db.hw5.services.OrmService;

import java.io.Closeable;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

/**
 * Iterates over a database result set by mapping each rows to an object
 */
public class ModelIterator<T extends GeoModel> implements Iterator<T>, AutoCloseable {

    private final ResultSet result;
    private final OrmService<T> orm;
    private T next;
    private int count;

    /**
     * Creates an iterator
     * @param orm ORM service for mapping rows to object
     * @param result DB result set cursor
     */
    public ModelIterator(OrmService<T> orm, ResultSet result) {
        assert orm != null;
        assert result != null;
        this.result = result;
        this.orm = orm;
        this.next = readNext();
    }

    @Override
    public boolean hasNext() {
        return next != null;
    }

    @Override
    public T next() {
        T tmp = next;
        next = readNext();
        return tmp;
    }

    private T readNext() {
        try {
            if (result.next()) {
                count++;
                System.out.println(count);
                return orm.mapRow(result);
            } else {
                this.close();
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public void close() throws IOException {
        try {
            if (!this.result.isClosed()) {
                this.result.close();
            }
        } catch (SQLException e) {
            throw new IOException(e);
        }
    }
}
