package org.spring.example.review;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

    /**
     * LocalDateTime과 JDBC Timestamp 간의 매핑을 위한 MyBatis TypeHandler.
     * 데이터베이스의 DATETIME/TIMESTAMP 컬럼을 Java의 LocalDateTime 객체로 변환합니다.
     */
    public class LocalDateTimeTypeHandler extends BaseTypeHandler<LocalDateTime> {

        @Override
        public void setNonNullParameter(PreparedStatement ps, int i, LocalDateTime parameter, JdbcType jdbcType) throws SQLException {
            // LocalDateTime 객체를 PreparedStatement에 Timestamp로 설정합니다.
            ps.setTimestamp(i, Timestamp.valueOf(parameter));
        }

        @Override
        public LocalDateTime getNullableResult(ResultSet rs, String columnName) throws SQLException {
            // 컬럼 이름으로 ResultSet에서 Timestamp 값을 가져와 LocalDateTime으로 변환합니다.
            Timestamp timestamp = rs.getTimestamp(columnName);
            return timestamp != null ? timestamp.toLocalDateTime() : null;
        }

        @Override
        public LocalDateTime getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
            // 컬럼 인덱스로 ResultSet에서 Timestamp 값을 가져와 LocalDateTime으로 변환합니다.
            Timestamp timestamp = rs.getTimestamp(columnIndex);
            return timestamp != null ? timestamp.toLocalDateTime() : null;
        }

        @Override
        public LocalDateTime getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
            // CallableStatement에서 Timestamp 값을 가져와 LocalDateTime으로 변환합니다.
            Timestamp timestamp = cs.getTimestamp(columnIndex);
            return timestamp != null ? timestamp.toLocalDateTime() : null;
        }
    }
