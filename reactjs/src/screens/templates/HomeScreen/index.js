import React from "react";
import { Col, Container, Row } from "react-bootstrap";
import { Line } from "react-chartjs-2";

const HomeScreenTemplate = ({ hosts, show, chartData, getMemoryInGb }) => (
  <div>
    {show && (
      <Container>
        <Row>
          <Col>
            <h1>{`${hosts[0].hostName} - ${
              hosts[0].macAddress
            } - Memoria Total ${getMemoryInGb(hosts[0].totalMemory)} GB`}</h1>
          </Col>
        </Row>
        <Row>
          <Col>
            <Line
              data={chartData}
              options={{
                title: {
                  display: true,
                  text: "RAM disponible en los últimos 30 registros",
                  fontSize: 20,
                },
                legend: {
                  display: true,
                  position: "right",
                },
              }}
            />
          </Col>
        </Row>
      </Container>
    )}
  </div>
);

export default HomeScreenTemplate;
