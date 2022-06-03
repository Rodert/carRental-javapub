package com.alfred.stat.service.impl;

import com.alfred.stat.domain.BaseEntity;
import com.alfred.stat.mapper.StatMapper;
import com.alfred.stat.service.StatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Alfred
 * @date 2020/3/16 13:18
 */
@Service
public class StatServiceImpl implements StatService {

    @Autowired
    private StatMapper statMapper;


    /**
     * 查询客户地区统计数据
     * @return
     */
    @Override
    public List<BaseEntity> loadCustomerAreaStatList() {
        return this.statMapper.queryCustomerAreaStat();
    }

    /**
     * 查询客户地区性别数据
     * @param area
     * @return
     */
    @Override
    public List<BaseEntity> loadCustomerAreaSexStatList(String area) {
        return this.statMapper.queryCustomerAreaSexStat(area);
    }

    /**
     * 查询业务员年度销售额统计数据
     * @param year
     * @return
     */
    @Override
    public List<BaseEntity> loadOpernameYearGradeStatList(String year) {
        return this.statMapper.queryOpernameYearGradeStat(year);
    }

    /**
     * 查询公司年度月份销售额数据
     * @param year
     * @return
     */
    @Override
    public List<Double> loadCompanyYearGradeStatList(String year) {
        return this.statMapper.queryCompanyYearGradeStat(year);
    }
}
