import React, { useEffect, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { getHosts } from "../../../redux/actions/hosts";
import { getMemoryHistories } from "../../../redux/actions/memoryHistories";

import HomeScreenTemplate from "../../templates/HomeScreen";

const HomeScreenContainer = () => {
  const dispatch = useDispatch();
  const { hosts, loadingHosts, errorHosts } = useSelector(
    (state) => state.hosts
  );
  const {
    memoryHistories,
    loadingMemoryHistories,
    errorMemoryHistories,
  } = useSelector((state) => state.memoryHistories);
  const [show, setShow] = useState(false);
  const [chartData, setChartData] = useState({});

  useEffect(() => {
    dispatch(getHosts());
    // eslint-disable-next-line
  }, []);

  useEffect(() => {
    if (!loadingHosts && hosts.length && !errorHosts) {
      dispatch(getMemoryHistories(hosts[0].id));
      setInterval(() => {
        dispatch(getMemoryHistories(hosts[0].id));
      }, 60000);
    }
  }, [loadingHosts, hosts, dispatch, errorHosts]);

  useEffect(() => {
    if (
      !loadingMemoryHistories &&
      memoryHistories.length &&
      !errorMemoryHistories
    ) {
      prepareChartData(memoryHistories);
    }
  }, [loadingMemoryHistories, memoryHistories, errorMemoryHistories]);

  const prepareChartData = async (memoryHistories) => {
    let labels = [];
    let data = [];
    memoryHistories.sort((a, b) => a.id - b.id);
    memoryHistories.forEach((memoryHistory) => {
      labels.push(memoryHistory.date);
      data.push(getMemoryInGb(memoryHistory.memory));
    });
    const chart = {
      labels,
      datasets: [
        {
          label: "RAM Disponible (GB)",
          fill: false,
          lineTension: 0.5,
          backgroundColor: "rgba(75,192,192,1)",
          borderColor: "rgba(0,0,0,1)",
          borderWidth: 2,
          data,
        },
      ],
      options: {
        scales: {
          yAxes: [
            {
              ticks: {
                suggestedMax: getMemoryInGb(hosts[0].totalMemory),
              },
            },
          ],
        },
      },
    };
    setChartData(chart);
    setShow(true);
  };

  const getMemoryInGb = (value) => {
    let total_mem_in_kb = value / 1024;
    let total_mem_in_mb = total_mem_in_kb / 1024;
    let total_mem_in_gb = total_mem_in_mb / 1024;
    return total_mem_in_gb.toFixed(2);
  };

  return (
    <HomeScreenTemplate
      {...{
        hosts,
        show,
        chartData,
        getMemoryInGb,
      }}
    />
  );
};

export default HomeScreenContainer;
