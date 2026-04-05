# OMNeT++ Simulation for Teleoperated Rover Communication

This repository contains three OMNeT++ simulation approaches for wireless data transmission in a teleoperated rover system, focusing on different mapping sensor configurations.

## Simulation Approaches

- **AP1 (LiDAR + RGB Camera):**  
  Simulates data transmission using LiDAR and RGB camera sensors for environment mapping.

- **AP2 (Depth Camera):**  
  Evaluates communication performance when using a depth camera as the primary sensing modality.

- **AP3 (LiDAR + Depth Camera):**  
  Combines LiDAR and depth camera data to analyze a hybrid sensing approach.

## Communication Model

The system uses:
- **UDP at the transport layer** to prioritize low latency
- A **custom application-layer protocol** for transmitting sensor data

This design choice ensures real-time performance, which is critical for teleoperation, even at the cost of reduced reliability.

## Objective

To analyze and compare the performance of different sensor configurations in terms of:
- Delay (latency)
- Packet loss
- Data transmission efficiency

## Structure

Each folder represents a simulation approach and contains:
- `omnetpp.ini` — simulation configuration
- `package.ned` — network topology definition
